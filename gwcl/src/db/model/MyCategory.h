//
//  MyCategory.h
//  gwcl
//
//  Created by sang alfred on 3/6/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 至少支持2级
 */
@interface MyCategory : No320BaseModel


/**
 * 分类名称
 */
@property(nonatomic,retain,readwrite) NSString *name;

/**
 * 分类归属
 */
@property(nonatomic,retain,readwrite) NSString *parent_id;


/**
 * 单位
 */
@property(nonatomic,retain,readwrite) NSString *danwei;


@end
