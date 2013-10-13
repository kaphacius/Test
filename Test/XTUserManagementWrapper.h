//
//  XTUserManagementWrapper.h
//  Test
//
//  Created by Yurii Zadoianchuk on 10/13/13.
//  Copyright (c) 2013 Yurii Zadoianchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XTUserModel;

@interface XTUserManagementWrapper : NSObject

+ (BOOL)createUserWithModel:(XTUserModel *)userModel;
+ (BOOL)authenticateUserWithModel:(XTUserModel *)userModel;
+ (BOOL)updateUserWithUserModel:(XTUserModel *)userModel;
+ (BOOL)deleteUserWithUserModel:(XTUserModel *)userModel;

@end
