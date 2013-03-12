//
//  IndexViewController.m
//  gwcl
//
//  Created by sang alfred on 3/6/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "IndexViewController.h"

@interface IndexViewController (){
    TopView *_topView;
    GouwuCur *_gouwu_cur_view;
}

@end

@implementation IndexViewController

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
//    [self.view setBackgroundColor:[UIColor orangeColor]];
    
    _topView = [[TopView alloc] initWithFrame:CGRectMake(0, 0, 320, 44) andIDelegate:self];
    [self.view addSubview:_topView];
//
//    _gouwu_cur_view = [[GouwuCur alloc] initWithFrame:CGRectMake(0, 44, 320, 197)];
//    [self.view addSubview:_gouwu_cur_view];
//
    
    CartTableViewController *cart_vc = [[CartTableViewController alloc] initWithStyle:UITableViewStylePlain];
    cart_vc.view.frame = CGRectMake(0, 44, 320, 480-64);
    cart_vc.clearsSelectionOnViewWillAppear = YES;
    [self.view addSubview:cart_vc.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TopViewProtocol implementions
-(void)left_btn_handler_callback:(UIButton *)btn
{

}

-(void)right_btn_handler_callback:(UIButton *)btn
{

}



@end
