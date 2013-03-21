//
//  MyCategory.h
//  gwcl
//
//  Created by sang alfred on 3/6/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import <Foundation/Foundation.h>

/****
 
 drop table tb_category;
 
 CREATE TABLE  tb_category(
 cid INTEGER primary key autoincrement,
 level number,
 pid number, 
 title VARCHAR2(255),
 danwei VARCHAR2(255),
 );
 
 
  
 insert into tb_category(level,title) values(1,'食品');
  insert into tb_category(level,title) values(1,'个人护理');
  insert into tb_category(level,title) values(1,'居家用品');
  insert into tb_category(level,title) values(1,'文体休闲');
  insert into tb_category(level,title) values(1,'电器');

 insert into tb_category(level,title,pid) values(2,'薯片',1);
  insert into tb_category(level,title,pid) values(2,'可乐',1);
  insert into tb_category(level,title,pid) values(2,'饼干',1);
  insert into tb_category(level,title,pid) values(2,'面包',1);
  insert into tb_category(level,title,pid) values(2,'土豆',1); 

 insert into tb_category(level,title,pid) values(2,'剃须刀',2);
 insert into tb_category(level,title,pid) values(2,'洗面奶',2);
 insert into tb_category(level,title,pid) values(2,'纸巾',2);
 
 
 insert into tb_category(level,title,pid) values(2,'桌子',3);
 insert into tb_category(level,title,pid) values(2,'凳子',3);
 insert into tb_category(level,title,pid) values(2,'床',3);
 
 
 
 ****/


/**
 * 至少支持2级
 */
@interface MyCategory : No320BaseModel


/**
 * 分类名称
 */
@property(nonatomic,retain,readwrite) NSString *name;



/**
 * 分类id
 */
@property(nonatomic,assign,readwrite) int c_id;
/**
 * 分类归属
 */
@property(nonatomic,assign,readwrite) int parent_id;

/**
 * 分类归属
 */
@property(nonatomic,assign,readwrite) int level;

/**
 * 单位
 */
@property(nonatomic,retain,readwrite) NSString *danwei;


@end
