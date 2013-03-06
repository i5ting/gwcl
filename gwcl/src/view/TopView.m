//
//  TopView.m
//  gwcl
//
//  Created by sang alfred on 3/6/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "TopView.h"

@interface TopView()
{
    UIImageView *_bg_view;
    UIButton *_left_btn;
    UIButton *_right_btn;
    UILabel *_title_label;
}

@end

@implementation TopView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        _bg_view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        [_bg_view setImage:[UIImage imageNamed:@"nab_background"]];
        [self addSubview:_bg_view];
        
        _left_btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _left_btn.frame = CGRectMake(10, 7, 40, 30);
        [_left_btn setImage:[UIImage imageNamed:@"nav_left_btn.jpg"] forState:UIControlStateNormal];
        
        [self addSubview:_left_btn];
        
        
        _right_btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _right_btn.frame = CGRectMake(270, 7, 40, 30);
        [_right_btn setImage:[UIImage imageNamed:@"nav_right_btn.jpg"] forState:UIControlStateNormal];        
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
