//
//  ViewController.m
//  MobileTeamTask
//
//  Created by Sania Zafar on 12/9/18.
//  Copyright © 2018 Sania Zafar. All rights reserved.
//

#import "DetailViewController.h"
#import "MobileTeamTableViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UISwitch *genderSwitch;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *DOB;
@property (weak, nonatomic) IBOutlet UIButton *actionButton;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.viewType == Update) {
        [self.actionButton setTitle:@"Update" forState:UIControlStateNormal];
        [self setDefaultDataForEdit];
    }
}


- (void)setDefaultDataForEdit {
    //TODO:  assign teamMember to UI elements
}


#pragma mark - Action

- (IBAction)addMe:(id)sender {
    if(self.firstName.text.length > 0 && self.lastName.text.length > 0) {
        MobileTeamMember *temTeamMember = [[MobileTeamMember alloc] init];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd MMM yyyy"];
        NSString *dateString = [dateFormatter stringFromDate:_DOB.date];
        [temTeamMember setTeamMember:[NSString stringWithFormat:@"%@ %@",self.firstName.text, self.lastName.text] withGender:_genderLabel.text DateofBirth:dateString];
        if (self.viewType == Update) {
            [self.delegate updateMemberAdded:temTeamMember];
        } else {
            [self.delegate newMemberAdded:temTeamMember];
        }
        [self.navigationController popViewControllerAnimated:TRUE];
    } else {
        [self showAlert];
    }
}


- (IBAction)gnederSwitched:(id)sender {
    if(_genderSwitch.isOn) {
        _genderLabel.text = @"Male";
    }
    else {
        _genderLabel.text = @"Female";
    }
}


- (void)showAlert {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Please Enter all the fields" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) { }];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
