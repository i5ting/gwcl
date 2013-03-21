//
//  MyCategoryDatabaseService.m
//  gwcl
//
//  Created by sang on 3/6/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "MyCategoryDatabaseService.h"

@implementation MyCategoryDatabaseService


DEFINE_SINGLETON_FOR_CLASS(MyCategoryDatabaseService)
//
//cid INTEGER primary key autoincrement,
//level number,
//pid number,
//title VARCHAR2(255),
//danwei VARCHAR2(255),
-(NSMutableArray *)find_first_level_category
{
    NSString *sql = @"select * from tb_category where level=1;";
    //
    NSMutableArray *f =[self find_by_sql:sql with_rs_callback:^No320BaseModel *(FMResultSet *_rs,int _line_num) {
        MyCategory *obj = [MyCategory new];
//        obj.cid =[_rs intForColumn:@"cid"];
        obj.parent_id =[_rs intForColumn:@"pid"];
        obj.name =[_rs stringForColumn:@"title"];
        obj.danwei =[_rs stringForColumn:@"danwei"];
        return obj;
    }];
    
    return f;
}

@end
