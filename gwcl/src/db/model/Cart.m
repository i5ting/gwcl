//
//  Cart.m
//  gwcl
//
//  Created by sang alfred on 3/6/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "Cart.h"

@implementation Cart

@synthesize date;
@synthesize all_count;
@synthesize finished_count;
@synthesize is_finished;
@synthesize desc;


-(void)dealloc{
    [desc release];
    //no retain object need release
    [super dealloc];
}

@end
