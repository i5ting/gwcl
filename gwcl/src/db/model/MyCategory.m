//
//  MyCategory.m
//  gwcl
//
//  Created by sang alfred on 3/6/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "MyCategory.h"

@implementation MyCategory

@synthesize name,danwei,parent_id;
@synthesize level;
@synthesize c_id;

-(void)dealloc
{
    [name release];
    [danwei release];
    [super dealloc];
}

@end
