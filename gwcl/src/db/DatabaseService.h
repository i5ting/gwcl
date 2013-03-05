//
//  DatabaseService.h
//  gwcl
//
//  Created by sang alfred on 3/5/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface DatabaseService : NSObject

@property(nonatomic,retain,readwrite) FMDatabase *db;


+ (id)sharedInstance;


@end
