//
//  Cart.h
//  gwcl
//
//  Created by sang alfred on 3/6/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import <Foundation/Foundation.h>
/****
 
 drop table tb_cart;
 
 CREATE TABLE  tb_cart(
 cid INTEGER primary key autoincrement,
 all_count number,
 finished_count number,
 desc VARCHAR2(255),
 is_finished number,
 cart_date number,
 CREATE_TIME DATETIME DEFAULT (datetime(CURRENT_TIMESTAMP,'localtime'))
 );
 
 
 
 CREATE UNIQUE INDEX tb_cart_idx ON tb_cart(cart_date DESC);
 
 insert into tb_cart(cart_date,all_count,finished_count) values(20130317,0,0);

 
 ****/
@interface Cart : No320BaseModel

@property(nonatomic,assign,readwrite) int date;

/**
 * 商品总数
 */
@property(nonatomic,assign,readwrite) int all_count;

/**
 * 已完成数
 */
@property(nonatomic,assign,readwrite) int finished_count;
@property(nonatomic,retain,readwrite) NSString *desc;

/**
 * 是否完成
 */
@property(nonatomic,assign,readwrite) int is_finished;

@end
