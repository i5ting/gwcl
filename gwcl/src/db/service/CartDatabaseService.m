//
//  CartDatabaseService.m
//  gwcl
//
//  Created by sang alfred on 3/6/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "CartDatabaseService.h"

@implementation CartDatabaseService

- (NSMutableArray *)find_all_in_cart{
    FMResultSet *_rs = [db executeQuery:@"select id,tid,zid,tName,tPicAddress,a1, a2, a3 , a4 , a5 , tanswer, tdesc from tb_shiti where id<30"];
    NSMutableArray *ret_array =  [[NSMutableArray alloc] init];
    
    if (_rs) {
        while ([_rs next]) {
            
            NSLog(@"--%@",[_rs stringForColumn:@"tName"]  );
            //            int * tid = [_rs intForColumn:@"id"];
            int mid = [_rs intForColumn:@"id"];
            NSString *tid = [_rs stringForColumn:@"tid"];
            NSString *zid = [_rs stringForColumn:@"zid"];
            NSString *tName = [_rs stringForColumn:@"tName"];
            NSString *tPicAddress = [_rs stringForColumn:@"tPicAddress"];
            NSString *a1 = [_rs stringForColumn:@"a1"];
            NSString *a2 = [_rs stringForColumn:@"a2"];
            NSString *a3 = [_rs stringForColumn:@"a3"];
            NSString *a4 = [_rs stringForColumn:@"a4"];
            NSString *a5 = [_rs stringForColumn:@"a5"];
            NSString *tanswer = [_rs stringForColumn:@"tanswer"];
            NSString *tdesc = [_rs stringForColumn:@"tdesc"];
            
            [ret_array addObject:tName];
//            DM_Shiti *shiti = [[DM_Shiti alloc] initWithId:mid tid:tid zid:zid ptName:tName tPicAddress:tPicAddress a1:a1 a2:a2 a3:a3 a4:a4 a5:a5 tanswer:tanswer tdesc:tdesc];
            
//            [ret_array addObject:shiti];
//            [shiti release];
        }
        return [ret_array autorelease];
        
    }else {
        [ret_array release];
        ret_array = nil;
        return nil;
    }
}

@end
