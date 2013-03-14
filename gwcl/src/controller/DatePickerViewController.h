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


@protocol DatePickerViewControllerProtocol <NSObject>

@required
-(void)shopping_date_ok_btn_click_callback:(NSString *)currentDateStr;

@end

@interface DatePickerViewController : UIViewController <DatePickerBgViewProtocol>{
    UIDatePicker *datePicker;
    DatePickerBgView *bgView;
}
@property(nonatomic,assign,readwrite) id<DatePickerViewControllerProtocol> delegate;
@property (nonatomic,retain) UIDatePicker *datePicker;
@property (nonatomic,retain) DatePickerBgView *bgView;

-(IBAction)buttonPressed;
@end