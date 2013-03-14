//
//  GoodsformTopView.m
//  gwcl
//
//  Created by sang alfred on 3/13/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "GoodsformTopView.h"

@interface GoodsformTopView()
{
    UIImageView *_bg_view;
    UIButton *_left_btn;
    UIButton *_right_btn;
    UILabel *_title_label;
}

@end

@implementation GoodsformTopView

@synthesize _delegate;

- (id)initWithFrame:(CGRect)frame andIDelegate:(id)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self._delegate = delegate;
        
        _bg_view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        [_bg_view setImage:[UIImage imageNamed:@"nab_background"]];
        [self addSubview:_bg_view];
        
        _left_btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _left_btn.frame = CGRectMake(10, 7, 40, 30);
        [_left_btn setImage:[UIImage imageNamed:@"nav_left_btn"] forState:UIControlStateNormal];
        [_left_btn setImage:[UIImage imageNamed:@"nav_left_btn_h"] forState:UIControlStateHighlighted];
        [_left_btn addTarget:self action:@selector(left_btn_handler:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_left_btn];
        
        
        _right_btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _right_btn.frame = CGRectMake(270, 7, 40, 30);
        [_right_btn setImage:[UIImage imageNamed:@"nav_right_btn"] forState:UIControlStateNormal];
        [_right_btn setImage:[UIImage imageNamed:@"nav_right_btn_h"] forState:UIControlStateHighlighted];
        [_right_btn addTarget:self action:@selector(right_btn_handler:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_right_btn];
        
        _title_label = [[UILabel alloc] initWithFrame:CGRectMake(100, 12, 123, 20)];
        _title_label.backgroundColor = [UIColor clearColor];
        _title_label.font = [UIFont systemFontOfSize:20];
        _title_label.textColor = [UIColor whiteColor];
        _title_label.text = @"购物清单单单";
        [self addSubview:_title_label];
        
    }
    return self;
}


#pragma mark - TopViewProtocol implementions

-(void)left_btn_handler:(UIButton *)btn{
    if ([_delegate respondsToSelector:@selector(left_btn_handler_callback:)]) {
        [self._delegate left_btn_handler_callback:btn];
    }
}

-(void)right_btn_handler:(UIButton *)btn{
    if ([_delegate respondsToSelector:@selector(left_btn_handler_callback:)]) {
        [self._delegate right_btn_handler_callback:btn];
    }
}


@end
