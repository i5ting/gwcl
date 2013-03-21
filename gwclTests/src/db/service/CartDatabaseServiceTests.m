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
    MyCategoryDatabaseService *category_dbs;
}
@end

@implementation CartDatabaseServiceTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    
    cdbs = [CartDatabaseService sharedInstance];
    category_dbs = [MyCategoryDatabaseService sharedInstance];
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



-(void)testInsert
{
    BOOL i = [cdbs insert_by_sql:@"sdfsdfsds"];
    
    assert_true(i, @"1 is succ");
}


-(void)testT
{
    [self benchmarking_with_message_and_execute_times_show_detail];
}



-(void)test_create_by_date
{
    BOOL t1=[cdbs create_by_date:@"20120412"];
    BOOL t2=[cdbs create_by_date:@"20120412"];
    BOOL t3=[cdbs create_by_date:@"20120413"];

//    assert_true(t1, @"first succ");
    
    assert_false(t2, @"uqi index,must be false");
}


-(void)test_delete_by_date
{
    BOOL f = [cdbs delete_by_date:@"20120412"];
    assert_true(f, @"no this date");
//    assert_false(f, @"no this date");
}


-(void)test_find_carts_by_date_desc
{
    NSMutableArray *m = [cdbs find_carts_by_date_desc];
    assert_true([m count]==2,@"目前有2个记录");
}

-(void)test_find_all_count
{
    int i = [cdbs find_all_count];
    assert_true(i > 1, @"count > 1 is succ");
}

-(void)test_find_all_count_by_date
{
    int i = [cdbs find_all_count_by_date:@"20130317"];
    assert_true(i > 0, @"count > 1 is succ");
}

#pragma mark - private

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

#pragma mark - dsdsdds

-(void)test_find_first_level
{
    NSMutableArray *m = [category_dbs find_first_level_category];
    NSLog(@"%@",m);
}

@end
