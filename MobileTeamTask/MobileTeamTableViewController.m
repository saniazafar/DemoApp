//
//  MobileTeamTableViewController.m
//  MobileTeamTask
//
//  Created by Sania Zafar on 12/9/18.
//  Copyright © 2018 Sania Zafar. All rights reserved.
//

#import "MobileTeamTableViewController.h"
#import "MobileTeamTableViewCell.h"
#import "AddViewController.h"



@interface MobileTeamTableViewController () <AddTeamMemberDelegate>

@end

@implementation MobileTeamTableViewController

@synthesize mobileTeamArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
   
    self.mobileTeamArray = [[NSMutableArray alloc] init];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.mobileTeamArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"teamCell" forIndexPath:indexPath];
    MobileTeamMember *member = [mobileTeamArray objectAtIndex:indexPath.row];
    cell.textLabel.text = member.name;
    cell.detailTextLabel.text = member.genderAndDob;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addTeamMember:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
   AddViewController *addViewController = [storyboard instantiateViewControllerWithIdentifier:@"addViewController"];
//    AddViewController *addViewController = [[AddViewController alloc] initw];
    addViewController.delegate = self;
    NSLog(@"self.nav %@", self.navigationController.navigationBar);
    [self.navigationController pushViewController:addViewController animated:YES];
}

- (void)newMemberAdded:(MobileTeamMember *)member {
    NSLog(@"mem %@", member.name);
    [mobileTeamArray addObject:member];
    [self.tableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
