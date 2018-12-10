//
//  ViewController.h
//  MobileTeamTask
//
//  Created by Sania Zafar on 12/9/18.
//  Copyright © 2018 Sania Zafar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MobileTeamMember.h"

@protocol addTeamMemberDelegate <NSObject>

- (void)newMemberAdded:(MobileTeamMember *)member;

@end


@interface AddViewController : UIViewController

@property (weak, nonatomic) id<addTeamMemberDelegate> delegate;

@end

