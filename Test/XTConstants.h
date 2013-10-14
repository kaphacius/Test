//
//  XTConstants.h
//  Test
//
//  Created by Yurii Zadoianchuk on 10/12/13.
//  Copyright (c) 2013 Yurii Zadoianchuk. All rights reserved.
//

#import "XTConstants.h"

@interface XTConstants : NSObject

+ (NSString *)kAccessTokenKey;
+ (NSString *)kEmailKey;
+ (NSString *)kFirstNameKey;
+ (NSString *)kIdKey;
+ (NSString *)kLastNameKey;
+ (NSString *)kUsernameKey;
+ (NSString *)kUserKey;
+ (NSString *)kApiUsernameHeader;
+ (NSString *)kApiAccessTokenHeader;
+ (NSString *)kErrorKey;
+ (NSString *)kOkKey;

+ (NSString *)kServerUrl;
+ (NSString *)kSuccessMesage;
+ (NSString *)kFailureMessage;
+ (NSString *)kMandatoryFieldsMessage;
+ (NSString *)kOkButtonTitle;
+ (NSString *)kCancelButtonTitle;
+ (NSString *)kBlockingViewNibName;

+ (NSInteger)kOkButtonIndex;
+ (NSInteger)kCancelButtonIndex;
+ (NSInteger)kBlockingViewTag;

@end