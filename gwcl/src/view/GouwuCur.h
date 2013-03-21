//
//  GouwuCur.h
//  gwcl
//
//  Created by sang alfred on 3/7/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol GouwuCurViewProtocol <NSObject>

@optional
-(void)addItem_callback:(UIButton *)btn;



@end



@interface GouwuCur : UIView

@property(nonatomic,assign,readwrite) id<GouwuCurViewProtocol> _delegate;
 

- (id)initWithFrame:(CGRect)frame andIDelegate:(id)delegate;

@end
