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
