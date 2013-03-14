//
//  GoodsFormViewController.m
//  gwcl
//
//  Created by sang alfred on 3/13/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "GoodsFormViewController.h"
#import "GoodsformTopView.h"

@interface GoodsFormViewController (){
    GoodsformTopView *_topView;
}

@end

@implementation GoodsFormViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _topView = [[GoodsformTopView alloc] initWithFrame:CGRectMake(0, 0, 320, 44) andIDelegate:self];
    [self.view addSubview:_topView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 
-(void)left_btn_handler_callback:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)right_btn_handler_callback:(UIButton *)btn
{
    
}


@end
