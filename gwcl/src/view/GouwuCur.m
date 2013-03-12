//
//  GouwuCur.m
//  gwcl
//
//  Created by sang alfred on 3/7/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "GouwuCur.h"

@interface GouwuCur()
{
    
    UIImageView *_bg_view;
    UIImageView *_gouwu_cur_view_bg;
    UIButton *_gouwu_cur_edit_btn;
    UIButton *_gouwu_cur_continue_btn;
    UILabel *_title_label;
}

@end


@implementation GouwuCur

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        _bg_view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 197)];
        [_bg_view setImage:[UIImage imageNamed:@"gouwu_cur_bg"]];
        [self addSubview:_bg_view];
        
        
        _gouwu_cur_view_bg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 300, 156)];
        [_gouwu_cur_view_bg setImage:[UIImage imageNamed:@"gouwu_cur_view"]];
        [self addSubview:_gouwu_cur_view_bg];
        
        _title_label = [[UILabel alloc] initWithFrame:CGRectMake(110, 12, 120, 44)];
        _title_label.text = @"2013-03-11";
        _title_label.font = [UIFont systemFontOfSize:20];
        _title_label.textColor = [UIColor orangeColor];
        _title_label.backgroundColor = [UIColor clearColor];
        [self addSubview:_title_label];
        
        
        _gouwu_cur_edit_btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _gouwu_cur_edit_btn.frame = CGRectMake(275, 20, 25, 25);
        [_gouwu_cur_edit_btn setImage:[UIImage imageNamed:@"gouwu_cur_edit_btn"] forState:UIControlStateNormal];
        [self addSubview:_gouwu_cur_edit_btn];
        
        _gouwu_cur_continue_btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _gouwu_cur_continue_btn.frame = CGRectMake(80, 120, 172, 34);
        [_gouwu_cur_continue_btn setImage:[UIImage imageNamed:@"gouwu_cur_continue_btn"] forState:UIControlStateNormal];
        [_gouwu_cur_continue_btn setImage:[UIImage imageNamed:@"gouwu_cur_continue_btn_h"] forState:UIControlStateHighlighted];
        [self addSubview:_gouwu_cur_continue_btn];
        
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
