//
//  CartDatabaseService.m
//  gwcl
//
//  Created by sang alfred on 3/6/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "CartDatabaseService.h"

@implementation CartDatabaseService

- (NSMutableArray *)find_all_in_cart{
    FMResultSet *_rs = [db executeQuery:@"select id,tid,zid,tName,tPicAddress,a1, a2, a3 , a4 , a5 , tanswer, tdesc from tb_shiti where id<30"];
    NSMutableArray *ret_array =  [[NSMutableArray alloc] init];
    
    if (_rs) {
        while ([_rs next]) {
            
//            NSLog(@"--%@",[_rs stringForColumn:@"tName"]  );
            //            int * tid = [_rs intForColumn:@"id"];
            int mid = [_rs intForColumn:@"id"];
            NSString *tid = [_rs stringForColumn:@"tid"];
            NSString *zid = [_rs stringForColumn:@"zid"];
            NSString *tName = [_rs stringForColumn:@"tName"];
            NSString *tPicAddress = [_rs stringForColumn:@"tPicAddress"];
            NSString *a1 = [_rs stringForColumn:@"a1"];
            NSString *a2 = [_rs stringForColumn:@"a2"];
            NSString *a3 = [_rs stringForColumn:@"a3"];
            NSString *a4 = [_rs stringForColumn:@"a4"];
            NSString *a5 = [_rs stringForColumn:@"a5"];
            NSString *tanswer = [_rs stringForColumn:@"tanswer"];
            NSString *tdesc = [_rs stringForColumn:@"tdesc"];
            
            [ret_array addObject:tName];
//            DM_Shiti *shiti = [[DM_Shiti alloc] initWithId:mid tid:tid zid:zid ptName:tName tPicAddress:tPicAddress a1:a1 a2:a2 a3:a3 a4:a4 a5:a5 tanswer:tanswer tdesc:tdesc];
            
//            [ret_array addObject:shiti];
//            [shiti release];
        }
        return [ret_array autorelease];
        
    }else {
        [ret_array release];
        ret_array = nil;
        return nil;
    }
}


-(NSMutableArray *)find_test_by_by_sql{
    
    NSString *sql = @"select id,tid,zid,tName,tPicAddress,a1, a2, a3 , a4 , a5 , tanswer, tdesc from tb_shiti where id<30";
//    
    
    __block No320BaseModel *cccc=1;
    
    NSMutableArray *f =[self find_by_sql:sql with_rs_callback:^No320BaseModel *(FMResultSet *_rs,int _line_num) {
        
        No320BaseModel *obj = [No320BaseModel new];
        obj.name =[_rs stringForColumn:@"tName"];
        
        
        if (_line_num == 1) {
            cccc = obj;
        }
        
        
        return obj;
        
    }];
    
    
    return f;
}

-(BOOL)insert_by_sql:(NSString *)tname
{
    NSString *sql = @"insert into tb_shiti(tName) values(?);";
    
    return  [db executeUpdate:sql,tname,nil];
}


-(BOOL)create_by_date:(NSString *)date
{
    NSString *sql = @"insert into tb_cart(cart_date,all_count,finished_count) values(?,0,0);";
    return  [db executeUpdate:sql,date,nil];

}


-(int)find_all_count{
    NSString *sql = @"select count(0) from tb_cart;";
    return [self find_one_column_by_sql:sql];
}

-(int)find_all_count_by_date{

}




@end
