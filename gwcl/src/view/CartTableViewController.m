//
//  CartTableViewController.m
//  gwcl
//
//  Created by sang alfred on 3/7/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "CartTableViewController.h"
#import "IndexViewController.h"

@interface CartTableViewController ()

@property(nonatomic,retain,readwrite) NSMutableArray *_data_array;

@end

@implementation CartTableViewController
@synthesize _data_array;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self._data_array = [[CartDatabaseService sharedInstance] find_carts_by_date_desc];
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    
}


-(void)reloadData{
    self._data_array = [[CartDatabaseService sharedInstance] find_carts_by_date_desc];
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 197.0f ;
    }else{
        return 49.0f;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self._data_array count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    // Configure the cell...
    
    Cart *cur_cart = [Cart new];
    
    if (indexPath.row == 0) {
        UITableViewCell *cell1 = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, 320, 197)];
        GouwuCur *_gouwu_cur_view = [[GouwuCur alloc] initWithFrame:CGRectMake(0, 0, 320, 197)];
        [cell1.contentView addSubview:_gouwu_cur_view];
        [_gouwu_cur_view release];
        return cell1;
        
    }else{
        int i = indexPath.row - 1;
        cur_cart = [self._data_array objectAtIndex:i];

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
    
    IndexViewController *i = [IndexViewController new];
     [self.navigationController pushViewController:i animated:YES];
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
