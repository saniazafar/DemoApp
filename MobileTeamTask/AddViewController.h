//
//  ViewController.h
//  MobileTeamTask
//
//  Created by Sania Zafar on 12/9/18.
//  Copyright © 2018 Sania Zafar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MobileTeamMember.h"

@protocol AddTeamMemberDelegate <NSObject>

- (void) newMemberAdded:(MobileTeamMember *)member;

@end

@interface AddViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UISwitch *genderSwitch;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *DOB;

@property (nonatomic) id<AddTeamMemberDelegate> delegate;

@end

