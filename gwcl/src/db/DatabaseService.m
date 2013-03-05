//
//  DatabaseService.m
//  gwcl
//
//  Created by sang alfred on 3/5/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "DatabaseService.h"

#define _DBFILE_NAME [NSString stringWithFormat:@"%@",@"cx_db.sqlite"]

#define _DBFILE_DIR  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];

@interface DatabaseService()


@end

@implementation DatabaseService


+ (DatabaseService *)sharedInstance {
	static DatabaseService *_sharedInstance;
	if(!_sharedInstance) {
		static dispatch_once_t oncePredicate;
		dispatch_once(&oncePredicate, ^{
			_sharedInstance = [[super allocWithZone:nil] init];
        });
    }
    return _sharedInstance;
}


+ (id)allocWithZone:(NSZone *)zone {
	return [self sharedInstance];
}


- (id)copyWithZone:(NSZone *)zone {
	return self;
}

#if (!__has_feature(objc_arc))

- (id)retain {
	return self;
}

- (unsigned)retainCount {
	return UINT_MAX;  //denotes an object that cannot be released
}

- (oneway void)release {
	//do nothing
}

- (id)autorelease {
	return self;
}

#endif

#pragma mark - lifecycle

- (id)init {
    if (self = [super init]) {
        NSLog(@"INFO: Begin singleton DataBaseService initialization......");
        
        NSString *bundlePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:_DBFILE_NAME];
        
        NSString *dir = _DBFILE_DIR;
        NSString *databasePath = [dir stringByAppendingPathComponent:_DBFILE_NAME];
        NSFileManager *tempFileManager = [NSFileManager defaultManager];
        BOOL isExisted = [tempFileManager fileExistsAtPath:databasePath];
        if (!isExisted) {
            NSLog(@"INFO_OC: 复制数据库文件 database.db from %@ to %@.", bundlePath, databasePath);
            NSError *error = nil;
            BOOL success = [[NSFileManager defaultManager] copyItemAtPath:bundlePath toPath:databasePath error:&error];
            if (!success) {
                NSLog(@"ERROR_OC: Failed to create writable database file with message '%@'.", [error localizedDescription]);
            }
        }
        
        db = [[FMDatabase databaseWithPath:databasePath] retain];
        //打开sql跟踪日志
        db.traceExecution = YES;
        db.logsErrors=YES;
        
        if (![db open]) {
            NSLog(@"INFO_OC: Failed to open database.");
            [db release];
            return self;
        }

        NSLog(@"INFO_OC: End singleton DataBaseService initialization......");
    }
    return self;
}

-(void)dealloc{
    [db close];
    [db release];
    [queue release];
    [super dealloc];
}

#pragma mark - Private Methods Implemetions



@end
