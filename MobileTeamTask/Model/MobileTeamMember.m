//
//  MobileTeamMember.m
//  MobileTeamTask
//
//  Created by Sania Zafar on 12/9/18.
//  Copyright © 2018 Sania Zafar. All rights reserved.
//

#import "MobileTeamMember.h"

@interface MobileTeamMember()

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *gender;
@property (strong, nonatomic) NSString *dob;

@end


@implementation MobileTeamMember

- (void)setTeamMember:(NSString *)name withGender:(NSString *)gender DateofBirth:(NSString *)dob {
    self.name = name;
    self.gender = gender;
    self.dob = dob;
}


- (NSString *)getMemberName {
    
    return self.name;
}


- (NSString *)getMemberGender {
    
    return self.gender;
}


- (NSString *)getMemberDOB {
    
    return self.dob;
}

@end
