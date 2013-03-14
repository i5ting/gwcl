//
//  GoodsformTopView.h
//  gwcl
//
//  Created by sang alfred on 3/13/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsformTopView : UIView

@property(nonatomic,assign,readwrite) id<TopViewProtocol> _delegate;

- (id)initWithFrame:(CGRect)frame andIDelegate:(id)delegate;

@end
