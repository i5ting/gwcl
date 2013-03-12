//
//  DatePickerViewController.h
//  gwcl
//
//  Created by sang alfred on 3/12/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface DatePickerViewController : UIViewController {
    UIDatePicker *datePicker;
}
@property (nonatomic,retain) IBOutlet UIDatePicker *datePicker;
-(IBAction)buttonPressed;
@end