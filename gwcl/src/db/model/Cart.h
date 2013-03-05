//
//  Cart.h
//  gwcl
//
//  Created by sang alfred on 3/6/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cart : NSObject

@property(nonatomic,retain,readwrite) NSString *date;

/**
 * 商品总数
 */
@property(nonatomic,retain,readwrite) NSString *all_count;

/**
 * 已完成数
 */
@property(nonatomic,retain,readwrite) NSString *finished_count;
@property(nonatomic,retain,readwrite) NSString *desc;

/**
 * 是否完成
 */
@property(nonatomic,retain,readwrite) NSString *is_finished;

@end
