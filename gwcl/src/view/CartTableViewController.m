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
        return 90.0f;
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
        
        GouwuCur *_gouwu_cur_view = [[GouwuCur alloc] initWithFrame:CGRectMake(0, 0, 320, 197)];
        [cell.contentView addSubview:_gouwu_cur_view];
        [_gouwu_cur_view release];
        
    }else{
        int i = indexPath.row - 1;
        cur_cart = [self._data_array objectAtIndex:i];

        UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        l.text = [NSString stringWithFormat:@"--%d ",cur_cart.date];
        [cell.contentView addSubview:l];
        [l release];
    }
    
   
    [cur_cart release];
    
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
