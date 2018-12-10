//
//  MobileTeamMember.h
//  MobileTeamTask
//
//  Created by Sania Zafar on 12/9/18.
//  Copyright © 2018 Sania Zafar. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MobileTeamMember : NSObject

- (void)setTeamMember:(NSString *)name withGender:(NSString *)gender DateofBirth:(NSString *)dob;
- (NSString *)getMemberName;
- (NSString *)getMemberGender;
- (NSString *)getMemberDOB;

@end

