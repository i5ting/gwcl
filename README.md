
## 源码

DatabaseService.h


```objective-c
#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"

@interface DatabaseService : NSObject{
    FMDatabase *db;
    FMDatabaseQueue *queue;
}

+ (id)sharedInstance;

@end
```
------------

DatabaseService.m

```objective-c
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

```



------------


## 知识点说明


### sqlite
目前来说，大部分人用的都是sqlite3数据库，当然ios上可以使用其他数据库，如leveldb等，主要是由于ios的开发语言是oc，可以无缝集成c和c++库。

### fmdb

大部分开发人员对oc熟悉，对c不够熟悉，所以用sqlite的时候会选择oc写的sqlite封装，即fmdb库。

如果大家熟悉db操作的话，可以发现fmdb其实和dbi::dbd接口非常相似，简单易用。

https://github.com/ccgus/fmdb

注意：不要把src下的fmdb.m放到你的项目中。

### 目录结构
默认情况下，每个沙盒含有3个文件夹：Documents, Library 和 tmp。因为应用的沙盒机制，应用只能在几个目录下读写文件
- Documents：苹果建议将程序中建立的或在程序中浏览到的文件数据保存在该目录下，- iTunes备份和恢复的时候会包括此目录
- Library：存储程序的默认设置或其它状态信息；
- Library/Caches：存放缓存文件，iTunes不会备份此目录，此目录下文件不会在应用退出删除
- tmp：提供一个即时创建临时文件的地方。
 
iTunes在与iPhone同步时，备份所有的Documents和Library文件。
iPhone在重启时，会丢弃所有的tmp文件。

所以我们常用的缓存目录是Library和Documents。

### 进入目录方法

```c
➜  00639313-2842-439B-A0E2-5ECB6EB497B0  pwd
/Users/alfred/Library/Application Support/iPhone Simulator/6.0/Applications/00639313-2842-439B-A0E2-5ECB6EB497B0
```

说明：6.0是模拟器版本号，一般会存在好几个版本的。
00639313-2842-439B-A0E2-5ECB6EB497B0是应用目录，具体打开看里面的文件就知道对不对了。

### 数据库用法

```c
	- (id)init {
	    if (self = [super init]) {
	        NSLog(@"INFO: Begin singleton DataBaseService initialization......");
        
	        NSString *bundlePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:_DBFILE_NAME];
        
	        NSString *dir = [self getDocumentsDir];
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
	        [self _db_create];
	        NSLog(@"INFO_OC: End singleton DataBaseService initialization......");
	    }
	    return self;
	}
```

1、首先，把数据库文件拷贝到缓存目录文件
2、创建数据库表结构
3、通过db这个全局变量操作数据库

### 以单例方式操作数据库

这里以gcd方式创建单例，控制了自己alloc问题，并兼容了arc情况。

	+ (CXDataService *)sharedInstance {
		static CXDataService *_sharedInstance;
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

这是非常常用的单例。

随便分享一点，困了


