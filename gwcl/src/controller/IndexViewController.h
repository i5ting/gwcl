//
//  IndexViewController.h
//  gwcl
//
//  Created by sang alfred on 3/6/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopView.h"
 
#import "DatePickerViewController.h"
#import "GoodsFormViewController.h"
#import "GoodsListViewController.h"

#import "DetailViewController.h"
#import "CartDatabaseService.h"
#import "GouwuCur.h"
#import "Cart.h"


@interface IndexViewController : UIViewController <TopViewProtocol
                                        , DatePickerViewControllerProtocol
                                        , UITableViewDelegate
                                        , UITableViewDataSource>


DEFINE_SINGLETON_FOR_HEADER(IndexViewController);

@end
