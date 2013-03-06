//
//  CartDatabaseService.h
//  gwcl
//
//  Created by sang alfred on 3/6/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "DatabaseService.h"

@interface CartDatabaseService : DatabaseService
- (NSMutableArray *)find_all_in_cart;


-(NSMutableArray *)find_test_by_by_sql;


-(BOOL)insert_by_sql:(NSString *)tname;


-(BOOL)create_by_date:(NSString *)date;

-(BOOL)delete_by_date:(NSString *)date;


-(NSMutableArray *)find_carts_by_date_desc;


-(int)find_all_count;

-(int)find_all_count_by_date;

@end
