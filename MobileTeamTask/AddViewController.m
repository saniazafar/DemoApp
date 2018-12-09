//
//  ViewController.m
//  MobileTeamTask
//
//  Created by Sania Zafar on 12/9/18.
//  Copyright © 2018 Sania Zafar. All rights reserved.
//

#import "AddViewController.h"
#import "MobileTeamTableViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)addMe:(id)sender {
    if(_firstName.text.length > 0 && _lastName.text.length > 0) {
        
        NSLog(@"%@ bb ", self.DOB.date);

        MobileTeamMember *teamMember = [[MobileTeamMember alloc] init];
        teamMember.name = [_firstName.text stringByAppendingString:_lastName.text];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd MMM yyyy"];
        NSString *dateString = [dateFormatter stringFromDate:_DOB.date];
        teamMember.genderAndDob = [_genderLabel.text stringByAppendingString:dateString];
        [self.delegate newMemberAdded:teamMember];
         
        
    }
    else {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Please Enter all the fields" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
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


@end
