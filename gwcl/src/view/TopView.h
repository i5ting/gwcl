//
//  TopView.h
//  gwcl
//
//  Created by sang alfred on 3/6/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TopViewProtocol <NSObject>

@optional
-(void)left_btn_handler_callback:(UIButton *)btn;

-(void)right_btn_handler_callback:(UIButton *)btn;

@end



@interface TopView : UIView

@property(nonatomic,assign,readwrite) id<TopViewProtocol> _delegate;

- (id)initWithFrame:(CGRect)frame andIDelegate:(id)delegate;

@end
