//
//  MobileTeamTableViewController.m
//  MobileTeamTask
//
//  Created by Sania Zafar on 12/9/18.
//  Copyright © 2018 Sania Zafar. All rights reserved.
//

#import "MobileTeamTableViewController.h"
#import "DetailViewController.h"

@interface MobileTeamTableViewController () <DetailViewControllerDelegate, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addBtn;
@property (nonatomic, retain) NSMutableArray *mobileTeamArray;
@property (assign, nonatomic) NSInteger lastSelectedRowIndex;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


@implementation MobileTeamTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.mobileTeamArray = [[NSMutableArray alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
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
    MobileTeamMember *member = [self.mobileTeamArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [member getMemberName];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@", [member getMemberDOB], [member getMemberGender]];
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.mobileTeamArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView reloadData];
    } else if(editingStyle == UITableViewCellEditingStyleNone) {
        [self.tableView setEditing:NO animated:YES];
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailViewController *detailViewController = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    detailViewController.teamMember = [self.mobileTeamArray objectAtIndex:indexPath.row];
    self.lastSelectedRowIndex = indexPath.row;
    detailViewController.delegate = self;
    detailViewController.viewType = Update;
    [self.navigationController pushViewController:detailViewController animated:YES];
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


#pragma mark - Actions

- (IBAction)addTeamMember:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailViewController *detailViewController = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    detailViewController.delegate = self;
    detailViewController.viewType = Add;
    [self.navigationController pushViewController:detailViewController animated:YES];
}


#pragma mark - DetailViewControllerDelegate

- (void)newMemberAdded:(MobileTeamMember *)member {
    [self.mobileTeamArray addObject:member];
    [self.tableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)updateMemberAdded:(MobileTeamMember *)member {
    [self.mobileTeamArray replaceObjectAtIndex:self.lastSelectedRowIndex withObject:member];
    [self.tableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
