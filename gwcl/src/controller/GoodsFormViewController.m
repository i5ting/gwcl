//
//  GoodsFormViewController.m
//  gwcl
//
//  Created by sang alfred on 3/13/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "GoodsFormViewController.h"
#import "GoodsformTopView.h"

#import "MyCategoryDatabaseService.h"

@interface GoodsFormViewController (){
    GoodsformTopView *_topView;
}


@property(nonatomic,retain,readwrite) UITableView *tableView;

@property(nonatomic,retain,readwrite) UIPickerView *category_picker_view;

@property(nonatomic,retain,readwrite) NSMutableArray *category_array;
@property(nonatomic,retain,readwrite) NSMutableArray *second_array;
@property(nonatomic,retain,readwrite) NSMutableDictionary *category_dict;

@end


#import "CartDatabaseService.h"
@implementation GoodsFormViewController
@synthesize tableView;
@synthesize category_picker_view;
@synthesize category_array;
@synthesize second_array;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
         [[CartDatabaseService sharedCartDatabaseService] find_carts_by_date_desc];
        MyCategoryDatabaseService *cdds = [MyCategoryDatabaseService instance];
        self.category_array = [cdds find_first_level_category];
        
        self.category_dict = [NSMutableDictionary dictionary];
        for (MyCategory *obj in self.category_array) {
            NSString *key = [NSString stringWithFormat:@"pid_%d",obj.c_id];
            NSLog(@"key = %@",key);
            NSArray *f = [cdds find_second_level_category:obj.c_id];
            
            [self.category_dict setObject:f forKey:key];
        }
        
        second_array = [NSMutableArray array];
        
        NSLog(@"%@",self.category_dict);
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
 
    UIButton *category_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [category_btn setImage:[UIImage imageNamed:@"goods_first_bf"] forState:UIControlStateNormal];
    category_btn.frame = CGRectMake(10, 44+20, 300, 50);
    
    [category_btn addTarget:self action:@selector(showCategoryView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:category_btn];

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(13, 44+20+50, 320-13*2, 480-44) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.scrollEnabled = NO;
    [self.view addSubview:tableView];
    
    
    _topView = [[GoodsformTopView alloc] initWithFrame:CGRectMake(0, 0, 320, 44) andIDelegate:self];
    [self.view addSubview:_topView];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background_yellow"]];
    
    UILabel *category_label = [[UILabel alloc] init];
    category_label.frame = CGRectMake(28, 82, 100, 15);
    category_label.backgroundColor = [UIColor clearColor];
    category_label.text = @"类别";
    category_label.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:category_label];
    
    
    UILabel *detial_label = [[UILabel alloc] init];
    detial_label.frame = CGRectMake(28, 82+50, 100, 15);
    detial_label.backgroundColor = [UIColor clearColor];
    detial_label.text = @"详细";
    detial_label.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:detial_label];
    
    
    UILabel *count_label = [[UILabel alloc] init];
    count_label.frame = CGRectMake(28, 82+100, 100, 15);
    count_label.backgroundColor = [UIColor clearColor];
    count_label.text = @"数量";
    count_label.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:count_label];
    
    
    UILabel *category_value_label = [[UILabel alloc] init];
    category_value_label.frame = CGRectMake(160, 82, 134, 15);
    category_value_label.backgroundColor = [UIColor clearColor];
    category_value_label.text = @"类别";
    category_value_label.font = [UIFont systemFontOfSize:14];
    category_value_label.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:category_value_label];
    
    
    UITextField *detial_text_field = [[UITextField alloc] init];
    detial_text_field.frame = CGRectMake(160, 82+45, 134, 25);
    detial_text_field.borderStyle = UITextBorderStyleLine;
    detial_text_field.textAlignment = NSTextAlignmentRight;
//    detial_text_field.backgroundColor = [UIColor clearColor];
    [self.view addSubview:detial_text_field];
    
    
    UITextField *count_text_field = [[UITextField alloc] init];
    count_text_field.frame = CGRectMake(160, 82+90, 134, 25);
    count_text_field.borderStyle = UITextBorderStyleRoundedRect;
    count_text_field.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:count_text_field];
    
    detial_text_field.delegate = self;
    count_text_field.delegate = self;
    
    
    category_picker_view = [[UIPickerView alloc] init];
    category_picker_view.delegate = self;
    category_picker_view.dataSource = self;
    category_picker_view.frame = CGRectMake(0, 250, 320, 300);
    [self.view addSubview:category_picker_view];
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



#pragma mark - table viewcontroller
-(void)reloadData{
//    self._data_array = [[CartDatabaseService sharedInstance] find_carts_by_date_desc];
    [self.tableView reloadData];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 49.0f;
    
//    if (indexPath.row == _cur_cell_index) {
//        return 197.0f ;
//    }else{
//        return 49.0f;
//    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    // Configure the cell...
    
 
    
    
    //    [cur_cart release];
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    //
    //     DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController.xib" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    
//    _cur_cell_index = indexPath.row;
    
    [self reloadData];
    //    IndexViewController *i = [IndexViewController new];
    //     [self.navigationController pushViewController:i animated:YES];
    //     [detailViewController release];
    
}


//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIImageView *v = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"goods_first_bf"]];
//    v.frame = CGRectMake(10, 44+20, 300, 480-44);
//    return v;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 50.0;
//}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *v = [UIView new];
    v.backgroundColor = [UIColor orangeColor];
    return [v autorelease];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1.0;
}


#pragma mark - Textfiled delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (void)showCategoryView:(UIButton *)btn
{
    
}

#pragma mark - UIPickerViewDataSource  delegate
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    int cid = [self.category_array objectAtIndex:component];
    NSString *key = [NSString stringWithFormat:@"pid_",cid];
  
    if (component == 0) {
        return [self.category_array count];
    }else{
        return 2;
    }
    
    
    return 2;
    if ([self.category_dict objectForKey:key]) {
        return [[self.category_dict objectForKey:key] count];
    }else{
        return 0;
    }
//    return [[self.category_dict objectForKey:key] count]>0 ? 0;
}

#pragma mark - UIPickerViewDelegate  delegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        MyCategory *c = [self.category_array objectAtIndex:row];
        
        return [(MyCategory *)[self.category_array objectAtIndex:row] name];
    }
    NSString *key = [NSString stringWithFormat:@"pid_%d",row];
    return key;
    return  [(MyCategory *)[self.category_dict objectForKey:key] name];
}


//只要选取器发生变化就会触发该事件，进行关联，具体就是当你更改第一个滚轮总的值是，第二个滚轮会自动更新
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
   
    if(component == 0){
        MyCategory *c = [self.category_array objectAtIndex:row];
        NSString *key = [NSString stringWithFormat:@"pid_%d",row];
        self.second_array = (NSArray *)[self.category_dict objectForKey:key]  ;
                         
        [category_picker_view selectRow:0 inComponent:1 animated:NO];
        [category_picker_view reloadComponent:1];//重新装载第二个滚轮中的值
        
    }
//    if(component == first)//如果响应的是第一个滚轮，则处理下面的动作
//    {
//        NSString *selectState = [self.firstArray objectAtIndex:row];//得到第一个滚轮当前的行
//        NSArray *array = [dictionary objectForKey:selectState];//根据第一个滚轮当前值从dictionary中选择对应的第二个滚轮中的值
//        self.secondArray = array;
//        [picker selectRow:0 inComponent:second animated:NO];
//        [picker reloadComponent:second];//重新装载第二个滚轮中的值
//    }
    
}
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component//使用委托设置Picker的大小
{
//    if(component == second)//如果是第二个滚轮，就设置大小为90
//        return 90;
    return 200;//否则设置为200
}


@end
