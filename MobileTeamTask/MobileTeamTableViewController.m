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
#import "DetailViewController.h"



@interface MobileTeamTableViewController () <AddTeamMemberDelegate, UpdateMemberDelegate>

@end

@implementation MobileTeamTableViewController

@synthesize mobileTeamArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
   // self.navigationItem.leftBarButtonItem.title = @"Edit";
   // [self.tableView setEditing:NO animated:YES];
    NSLog(@"%d",[self.tableView isEditing]);

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



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        MobileTeamMember *member = [mobileTeamArray objectAtIndex:indexPath.row];
        [mobileTeamArray removeObject:member];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        //editingStyle = UITableViewCellEditingStyleNone;
        NSLog(@"%d",[self isEditing]);
        [self.tableView reloadData];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    else if(editingStyle == UITableViewCellEditingStyleNone) {
        [self.tableView setEditing:NO animated:YES];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailViewController *detailViewController = [storyboard instantiateViewControllerWithIdentifier:@"detailViewController"];
    MobileTeamMember *member = [mobileTeamArray objectAtIndex:indexPath.row];
    detailViewController.teamMember = member;
    detailViewController.selectedRowIndex = indexPath.row;
    detailViewController.updateDelegate = self;
    [self.navigationController pushViewController:detailViewController animated:YES];
}

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

- (void)updateMember:(MobileTeamMember *)member index:(NSInteger)rowIndex{
    NSLog(@"mem %@", member.genderAndDob);
    [mobileTeamArray replaceObjectAtIndex:rowIndex withObject:member];
//    MobileTeamMember *teamMember = [mobileTeamArray objectAtIndex:rowIndex];
//    teamMember = member;
//    NSLog(@"mem %@", teamMember.genderAndDob);
    [self.tableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    
    [self.tableView setEditing:editing animated:animated];
    
    if([self.tableView isEditing]) {
        self.navigationItem.rightBarButtonItem.enabled = NO;
    }
    else {
        self.navigationItem.rightBarButtonItem.enabled = YES;
    }
}

@end
