//
//  MyCategoryDatabaseService.h
//  gwcl
//
//  Created by sang on 3/6/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "DatabaseService.h"
#import "MyCategory.h"

@interface MyCategoryDatabaseService : DatabaseService

DEFINE_SINGLETON_FOR_HEADER(MyCategoryDatabaseService)

-(NSMutableArray *)find_first_level_category;

@end
