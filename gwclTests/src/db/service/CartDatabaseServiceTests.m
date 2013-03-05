//
//  CartDatabaseServiceTests.m
//  gwcl
//
//  Created by sang alfred on 3/6/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "CartDatabaseServiceTests.h"

@implementation CartDatabaseServiceTests

-(void)testConnection
{
    CartDatabaseService *cdbs = [CartDatabaseService sharedInstance];
    
    NSArray *ret = [cdbs find_all_in_cart];
    
    for (NSString *name in ret) {
        LOG_EXPR(name);
    }

}

@end
