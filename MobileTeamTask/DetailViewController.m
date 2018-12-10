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
    
    _nameLabel.text = teamMember.name;
    _DOBTextField.text = teamMember.genderAndDob;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)updateDetails:(id)sender {
    MobileTeamMember *member = [[MobileTeamMember alloc]init];
    member.name = _nameLabel.text;
    member.genderAndDob = _DOBTextField.text;
    [self.updateDelegate updateMember:member index:_selectedRowIndex];
}

@end
