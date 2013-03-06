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

@end
