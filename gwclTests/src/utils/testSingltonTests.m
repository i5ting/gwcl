//
//  testSingltonTests.m
//  gwcl
//
//  Created by sang alfred on 3/5/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "testSingltonTests.h"
#import "testSingleton.h"

@implementation testSingltonTests

-(void)testSingleton
{
    testSingleton *old_obj = [testSingleton sharedtestSingleton];
//    STAssertEqualObjects(a1, a2, description, ...)
    
    testSingleton *new_obj = [testSingleton sharedtestSingleton];
    
    STAssertEqualObjects( old_obj , new_obj , @"这2个对象应该是一样的" );
    
}

@end
