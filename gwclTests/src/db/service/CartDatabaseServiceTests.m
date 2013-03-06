//
//  CartDatabaseServiceTests.m
//  gwcl
//
//  Created by sang alfred on 3/6/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "CartDatabaseServiceTests.h"

@interface CartDatabaseServiceTests()
{
    CartDatabaseService *cdbs;
}
@end

@implementation CartDatabaseServiceTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    
    cdbs = [CartDatabaseService sharedInstance];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

-(void)testConnection
{
    
    NSArray *ret = [cdbs find_all_in_cart];
    
    for (NSString *name in ret) {
        LOG_EXPR(name);
    }

}


 

-(void)testT
{
     
    
    [self benchmarking_with_message_and_execute_times_show_detail];

    
    
    
}



-(void)benchmarking_with_message_and_execute_times
{
    benchmarking_with_message_and_execute_times(^{
        NSMutableArray *f = [cdbs find_test_by_by_sql];

        No320BaseModel *m = [f objectAtIndex:0];


        assert_nil(nil, @"sslsls");
    }, @"多次执行哦", 12);
}

-(void)benchmarking
{
    benchmarking(^{
        NSMutableArray *f = [cdbs find_test_by_by_sql];

        No320BaseModel *m = [f objectAtIndex:0];


        assert_nil(nil, @"sslsls");
    });
    
}


-(void)benchmarking_with_message_and_execute_times_show_detail
{
    benchmarking_with_message_and_execute_times_show_detail(^{
        NSMutableArray *f = [cdbs find_test_by_by_sql];

        No320BaseModel *m = [f objectAtIndex:0];


        assert_nil(nil, @"sslsls");
    }, @"多次执行哦", 3);
    
    
}
-(void)benchmarking_with_message
{
    benchmarking_with_message(^{
        NSMutableArray *f = [cdbs find_test_by_by_sql];
        
        No320BaseModel *m = [f objectAtIndex:0];
        
        
        assert_nil(nil, @"sslsls");
    },@"这是自定义的消息");
    
    
    benchmarking_with_message(^{
        NSMutableArray *f = [cdbs find_test_by_by_sql];
        
        No320BaseModel *m = [f objectAtIndex:0];
        
        
        assert_nil(nil, @"sslsls");
    },@"这是自定义的消息");
    
    
    benchmarking_with_message(^{
        NSMutableArray *f = [cdbs find_test_by_by_sql];
        
        No320BaseModel *m = [f objectAtIndex:0];
        
        
        assert_nil(nil, @"sslsls");
    },@"这是自定义的消息");

}

@end
