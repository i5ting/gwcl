//
//  DatabaseService.h
//  gwcl
//
//  Created by sang alfred on 3/5/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"

@interface DatabaseService : NSObject{
    FMDatabase *db;
    FMDatabaseQueue *queue;
}

+ (id)sharedInstance;

@end
