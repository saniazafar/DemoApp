//
//  DetailViewController.h
//  MobileTeamTask
//
//  Created by Sania Zafar on 12/10/18.
//  Copyright © 2018 Sania Zafar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MobileTeamMember.h"

@protocol UpdateMemberDelegate <NSObject>

- (void) updateMember:(MobileTeamMember *)member index:(NSInteger)rowIndex;

@end

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *DOBTextField;

@property (nonatomic) MobileTeamMember *teamMember;
@property (nonatomic) id<UpdateMemberDelegate> updateDelegate;
@property (nonatomic) NSInteger selectedRowIndex;

@end


