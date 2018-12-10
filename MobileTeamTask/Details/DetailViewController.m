//
//  DetailViewController.m
//  MobileTeamTask
//
//  Created by Sania Zafar on 12/10/18.
//  Copyright © 2018 Sania Zafar. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize teamMember;

- (void)viewDidLoad {
    [super viewDidLoad];
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _nameLabel.text = [teamMember getMemberName];
    _DOBTextField.text = [teamMember getMemberDOB];
}


#pragma mark - Action

- (IBAction)updateDetails:(id)sender {
    [teamMember setTeamMember:_nameLabel.text withGender:@"" DateofBirth:_DOBTextField.text];
    [self.updateDelegate updateMember:teamMember index:_selectedRowIndex];
}

@end
