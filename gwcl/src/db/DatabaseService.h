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

#import "No320BaseModel.h"


@interface DatabaseService : NSObject{
    FMDatabase *db;
    FMDatabaseQueue *queue;
}

+ (id)sharedInstance;

@property(nonatomic,assign,readwrite) BOOL traceExecution;
@property(nonatomic,assign,readwrite) BOOL logsErrors;

/**
 *
 *  
 *
 */
-(NSMutableArray *)find_by_sql:(NSString *)query_sql with_rs_callback:( No320BaseModel *(^)(FMResultSet *_rs/*result set*/,int _line_num/*record in result number(from 0)*/))rs_block NS_AVAILABLE(10_6, 4_0);


/**
 * 所有返回一个字段的，都可以使用此
 *
 *
 */
-(int)find_one_column_by_sql:(NSString *)query_sql;
 
//- (void)enumerateObjectsUsingBlock:(void (^)(id obj, NSUInteger idx, BOOL *stop))block NS_AVAILABLE(10_6, 4_0);

@end
