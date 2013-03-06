//
//  CartDatabaseService.m
//  gwcl
//
//  Created by sang alfred on 3/6/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "CartDatabaseService.h"

@implementation CartDatabaseService


-(BOOL)create_by_date:(NSString *)date
{
    NSString *sql = @"insert into tb_cart(cart_date,all_count,finished_count) values(?,0,0);";
    return  [db executeUpdate:sql,date,nil];
}

-(BOOL)delete_by_date:(NSString *)date
{
    NSString *sql = @"delete from tb_cart where cart_date=?;";
    return  [db executeUpdate:sql,date,nil];
}

-(NSMutableArray *)find_carts_by_date_desc
{
    NSString *sql = @"select * from tb_cart order by cart_date desc";
    //
    NSMutableArray *f =[self find_by_sql:sql with_rs_callback:^No320BaseModel *(FMResultSet *_rs,int _line_num) {
        Cart *obj = [Cart new];
        obj.date =[_rs intForColumn:@"cart_date"];
        obj.all_count =[_rs intForColumn:@"all_count"];
        obj.finished_count =[_rs intForColumn:@"finished_count"];
        obj.is_finished =[_rs intForColumn:@"is_finished"];
        return obj;
    }];
 
    return f;
}


-(int)find_all_count{
    NSString *sql = @"select count(0) from tb_cart;";
    return [self find_one_column_by_sql:sql];
}

-(int)find_all_count_by_date:(NSString *)date
{
    NSString *sql = [NSString stringWithFormat:@"select count(0) from tb_cart where cart_date=%@",date];
    return [self find_one_column_by_sql:sql];
}

@end
