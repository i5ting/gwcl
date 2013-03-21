//
//  CartDatabaseService.h
//  gwcl
//
//  Created by sang alfred on 3/6/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "DatabaseService.h"
#import "Cart.h"
#import "MyCategory.h"

@interface CartDatabaseService : No320DatabaseService

AS_SINGLETON(CartDatabaseService)

DEFINE_SINGLETON_FOR_HEADER(CartDatabaseService)
//ok
-(BOOL)create_by_date:(NSString *)date;

//ok
-(BOOL)delete_by_date:(NSString *)date;

//ok
-(NSMutableArray *)find_carts_by_date_desc;

//ok
-(int)find_all_count;

//ok
-(int)find_all_count_by_date:(NSString *)date;
 

@end
