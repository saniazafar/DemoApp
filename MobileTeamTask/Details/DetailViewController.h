//
//  ViewController.h
//  MobileTeamTask
//
//  Created by Sania Zafar on 12/9/18.
//  Copyright © 2018 Sania Zafar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MobileTeamMember.h"

typedef enum DetailViewScreenType {
    Add,
    Update,
} DetailViewType;


@protocol DetailViewControllerDelegate <NSObject>

- (void)newMemberAdded:(MobileTeamMember *)member;
- (void)updateMemberAdded:(MobileTeamMember *)member;

@end


@interface DetailViewController : UIViewController

@property (strong, nonatomic) MobileTeamMember *teamMember;
@property (weak, nonatomic) id<DetailViewControllerDelegate> delegate;
@property (assign) DetailViewType viewType;

@end

