//
//  IndexViewController.m
//  gwcl
//
//  Created by sang alfred on 3/6/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "IndexViewController.h"
#import "CartDatabaseService.h"
#import "MyCategoryDatabaseService.h"

#import "GouwuCur.h"

@interface IndexViewController (){
    TopView *_topView;
    GouwuCur *_gouwu_cur_view;
    //当前cell的index。从0开始    
    int _cur_cell_index;

}
@property(nonatomic,retain,readwrite) UITableView *tableView;
@property(nonatomic,retain,readwrite) NSMutableArray *_data_array;

@end

@implementation IndexViewController

@synthesize _data_array;
@synthesize tableView;

DEFINE_SINGLETON_FOR_CLASS(IndexViewController);


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self._data_array = [[CartDatabaseService sharedCartDatabaseService] find_carts_by_date_desc];
        _cur_cell_index = 0;
        
        
//       MyCategoryDatabaseService *mm =  [[MyCategoryDatabaseService alloc] init];
//
//        NSMutableArray *m = [[MyCategoryDatabaseService sharedMyCategoryDatabaseService] find_first_level_category];
//        NSLog(@"%@",m);
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [self reloadData];
    [[self.view viewWithTag:100001] removeFromSuperview];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    [self.view setBackgroundColor:[UIColor orangeColor]];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, 320, 480-44) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:tableView];
    
    _topView = [[TopView alloc] initWithFrame:CGRectMake(0, 0, 320, 44) andIDelegate:self];
    [self.view addSubview:_topView];
    
    
    
//
//    _gouwu_cur_view = [[GouwuCur alloc] initWithFrame:CGRectMake(0, 44, 320, 197)];
//    [self.view addSubview:_gouwu_cur_view];
//
    
//    cart_vc = [[CartTableViewController alloc] initWithStyle:UITableViewStylePlain];
//    cart_vc.view.frame = CGRectMake(0, 44, 320, 480-64);
//    cart_vc.clearsSelectionOnViewWillAppear = YES;
//    [self.view addSubview:cart_vc.view];
    
    [self.tableView reloadData];
//    [self reloadData];
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
    DatePickerViewController *dvc = [DatePickerViewController new];
    dvc.delegate = self;
    dvc.view.frame = CGRectMake(0, 0, 320, 480);
    dvc.view.tag = 100001;
    [self.view addSubview:dvc.view];
}

-(void)shopping_date_ok_btn_click_callback:(NSString *)currentDateStr
{
    BOOL is_saved = [[CartDatabaseService sharedCartDatabaseService] create_by_date:currentDateStr];
    if (is_saved) {
        GoodsFormViewController *f = [GoodsFormViewController new];
        [self.navigationController pushViewController:f animated:YES];
    }else{
        UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"消息提示" message:@"保存出错，估计是已经存在了此天记录" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] autorelease];
        [alert show];
    }
}


-(void)addItem_callback:(UIButton *)btn
{
    GoodsFormViewController *f = [GoodsFormViewController new];
    [self.navigationController pushViewController:f animated:YES];
    
}

#pragma mark - table viewcontroller
-(void)reloadData{
    self._data_array = [[CartDatabaseService sharedCartDatabaseService] find_carts_by_date_desc];
    [self.tableView reloadData];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == _cur_cell_index) {
        return 197.0f ;
    }else{
        return 49.0f;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self._data_array count];
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
    
    Cart *cur_cart = [Cart new];
    
    if (indexPath.row == _cur_cell_index) {
        UITableViewCell *cell1 = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, 320, 197)];
        GouwuCur *_gouwu_cur_view = [[GouwuCur alloc] initWithFrame:CGRectMake(0, 0, 320, 197) andIDelegate:self];
        [cell1.contentView addSubview:_gouwu_cur_view];
//        [_gouwu_cur_view release];
        return cell1;
        
    }else{
        //        int i = indexPath.row - 1;
        cur_cart = [self._data_array objectAtIndex:indexPath.row];
        
        //        cell.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"index_cell_bg"]];
        
        UIImageView *bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 49)];
        bg.image = [UIImage imageNamed:@"index_cell_bg"];
        [cell.contentView addSubview:bg];
        [bg release];
        
        NSLog(@"date = %d",cur_cart.date);
        NSString *date = [NSString stringWithFormat:@"%d",cur_cart.date];
        NSString *year = [date substringWithRange:NSMakeRange(0, 4)];
        NSString *month = [date substringWithRange:NSMakeRange(4, 2)];
        NSString *day = [date substringWithRange:NSMakeRange(6, 2)];
        
        //        l.text = [NSString stringWithFormat:@"--%d ",cur_cart.date];
        
        NSString *y_and_m_str = [NSString stringWithFormat:@"%@-%@",year,month];
        
        UILabel *ym_label = [[UILabel alloc] initWithFrame:CGRectMake(10, 32, 38, 10)];
        ym_label.backgroundColor = [UIColor clearColor];
        ym_label.font = [UIFont systemFontOfSize:9.0];
        ym_label.text = y_and_m_str;
        [cell.contentView addSubview:ym_label];
        [ym_label release];
        
        
        UILabel *d_label = [[UILabel alloc] initWithFrame:CGRectMake(12, 7, 38, 22)];
        d_label.backgroundColor = [UIColor clearColor];
        d_label.font = [UIFont boldSystemFontOfSize:24.0];
        d_label.text = day;
        [cell.contentView addSubview:d_label];
        [d_label release];
        
        UILabel *count_label = [[UILabel alloc] initWithFrame:CGRectMake(145, 18, 38, 14)];
        count_label.backgroundColor = [UIColor clearColor];
        count_label.font = [UIFont systemFontOfSize:14.0];
        count_label.text = @"55 件";
        [cell.contentView addSubview:count_label];
        [count_label release];
        
        
        UILabel *finish_label = [[UILabel alloc] initWithFrame:CGRectMake(236, 18, 38, 14)];
        finish_label.backgroundColor = [UIColor clearColor];
        finish_label.font = [UIFont systemFontOfSize:14.0];
        finish_label.text = @"22 件";
        [cell.contentView addSubview:finish_label];
        [finish_label release];
    }
    
    
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
    
    _cur_cell_index = indexPath.row;
    
    [self reloadData];
    //    IndexViewController *i = [IndexViewController new];
    //     [self.navigationController pushViewController:i animated:YES];
    //     [detailViewController release];
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *v = [UIView new];
    v.backgroundColor = [UIColor orangeColor];
    return [v autorelease];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1.0;
}

 



@end
