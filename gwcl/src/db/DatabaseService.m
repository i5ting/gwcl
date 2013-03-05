//
//  DatabaseService.m
//  gwcl
//
//  Created by sang alfred on 3/5/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "DatabaseService.h"

@interface DatabaseService(){


}

-(void)createDb;


@end

@implementation DatabaseService

@synthesize db;

+ (id)sharedInstance
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init]; // or some other init method
        
       
    });
    return _sharedObject;
}
  

-(id)init
{
    if (self = [super init]) {
        
       
        [self copy_file_database];
        
//        self.db = [FMDatabase databaseWithPath:documentsDatabasePath];
    }
    return self;
}

-(void)copy_file_database
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *documentLibraryFolderPath = [documentsDirectory stringByAppendingPathComponent:@"db/"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:documentLibraryFolderPath]) {
        NSLog(@"文件已经存在了");
    }else {
        NSString *resourceSampleImagesFolderPath =[[NSBundle mainBundle]
                                                   pathForResource:@"gwcl"
                                                   ofType:@"sqlite3"];
        NSData *mainBundleFile = [NSData dataWithContentsOfFile:resourceSampleImagesFolderPath];
        [[NSFileManager defaultManager] createFileAtPath:documentLibraryFolderPath
                                                contents:mainBundleFile
                                              attributes:nil];
    }
}
-(void)delete_file_databade
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *documentLibraryFolderPath = [documentsDirectory stringByAppendingPathComponent:@"elimimation"];
    [[NSFileManager defaultManager] delete:documentLibraryFolderPath];
}


-(void)createDb
{
    
    
}



@end
