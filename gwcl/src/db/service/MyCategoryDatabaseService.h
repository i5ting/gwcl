//
//  MyCategoryDatabaseService.h
//  gwcl
//
//  Created by sang on 3/6/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "DatabaseService.h"
#import "MyCategory.h"

@interface MyCategoryDatabaseService : No320DatabaseService

AS_SINGLETON(MyCategoryDatabaseService)

DEFINE_SINGLETON_FOR_HEADER(MyCategoryDatabaseService)

-(NSMutableArray *)find_first_level_category;


-(NSMutableArray *)find_second_level_category:(int)pid;

@end
