    //
//  DatePickerViewController.m
//  gwcl
//
//  Created by sang alfred on 3/12/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "DatePickerViewController.h"

@implementation DatePickerBgView

@synthesize _delegate;

- (id)initWithFrame:(CGRect)frame andIDelegate:(id)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self._delegate = delegate;
        
        self.backgroundColor = [UIColor blackColor];
        self.opaque = YES;
        self.alpha = 0.5f;
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([_delegate respondsToSelector:@selector(datePickerBgView_touch_callback)]) {
        [_delegate datePickerBgView_touch_callback];
    }
}

@end

@implementation DatePickerViewController
@synthesize datePicker,bgView;


/*
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization
 }
 return self;
 }
 */
/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
    self.bgView = [[DatePickerBgView alloc] initWithFrame:CGRectMake(0, 0, 320, 480) andIDelegate:self];
    [self.view addSubview:bgView];

    UIImageView *shopping_date_image_view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 217, 106, 29)];
    shopping_date_image_view.image = [UIImage imageNamed:@"shopping_date_image"];
    [self.view addSubview:shopping_date_image_view];
    [shopping_date_image_view release];
    
    
    UIButton *shopping_date_ok_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    shopping_date_ok_btn.frame = CGRectMake(246, 203, 74, 44);
    [shopping_date_ok_btn setImage:[UIImage imageNamed:@"shopping_date_ok"] forState:UIControlStateNormal];
    [self.view addSubview:shopping_date_ok_btn];
    [shopping_date_ok_btn release];
    
    
    datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.frame = CGRectMake(0, 245, 320, 400);
    
 
    [datePicker setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    
    [self.view addSubview:datePicker];
    
    NSDate *now=[[NSDate alloc] init];
    [datePicker setDate:now animated:NO];
    [now release];
    [super viewDidLoad];
}

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.datePicker=nil;
}
-(IBAction)buttonPressed
{
    NSDate  *selected=[datePicker date];
    NSString *message = [[NSString alloc] initWithFormat:@"The date and time you selected is:%@",selected];
    UIAlertView *alert= [[UIAlertView  alloc] initWithTitle:@"Date and Time Selected"
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"Yes,i did"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
    [message release];
    
}

- (void)dealloc {
    [bgView release];
    [datePicker release];
    [super dealloc];
}

#pragma mark - DatePickerBgViewProtocol protocol implementions

-(void)datePickerBgView_touch_callback
{
    [self.datePicker removeFromSuperview];
    [self.bgView removeFromSuperview];
    [self.view removeFromSuperview];
}


@end