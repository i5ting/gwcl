//
//  Item.h
//  gwcl
//
//  Created by sang alfred on 3/6/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : No320BaseModel


/**
 * 分类id
 */
@property(nonatomic,assign,readwrite) int category_id;



/**
 * 详细
 */
@property(nonatomic,retain,readwrite) NSString *details;




/**
 * 商品总数
 */
@property(nonatomic,assign,readwrite) int *count;



/**
 * 是否完成
 */
@property(nonatomic,assign,readwrite) int *is_finished;


@end
