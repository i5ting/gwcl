//
//  DatePickerViewController.h
//  gwcl
//
//  Created by sang alfred on 3/12/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DatePickerBgViewProtocol <NSObject>

@required
-(void)datePickerBgView_touch_callback;

@end

@interface DatePickerBgView : UIView

@property(nonatomic,assign,readwrite) id<DatePickerBgViewProtocol> _delegate;

- (id)initWithFrame:(CGRect)frame andIDelegate:(id)delegate;

@end

@interface DatePickerViewController : UIViewController <DatePickerBgViewProtocol>{
    UIDatePicker *datePicker;
}
@property (nonatomic,retain) IBOutlet UIDatePicker *datePicker;
-(IBAction)buttonPressed;
@end