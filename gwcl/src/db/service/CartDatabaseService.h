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
@end
