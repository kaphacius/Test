//
//  XTConstants.m
//  Test
//
//  Created by Yurii Zadoianchuk on 10/12/13.
//  Copyright (c) 2013 Yurii Zadoianchuk. All rights reserved.
//

#import "XTConstants.h"

@implementation XTConstants

+ (NSString *)kAccessTokenKey
{
    return @"access_token";
}

+ (NSString *)kEmailKey
{
    return @"email";
}

+ (NSString *)kFirstNameKey
{
    return @"first_name";
}

+ (NSString *)kIdKey
{
    return @"id";
}

+ (NSString *)kLastNameKey
{
    return @"last_name";
}

+ (NSString *)kUsernameKey
{
    return @"username";
}

+ (NSString *)kUserKey
{
    return @"user";
}

+ (NSString *)kApiUsernameHeader
{
    return @"api_username";
}

+ (NSString *)kApiAccessTokenHeader
{
    return @"api_access_token";
}

+ (NSString *)kErrorKey
{
    return @"error";
}

+ (NSString *)kOkKey
{
    return @"ok";
}

+ (NSString *)kServerUrl
{
   return @"http://127.0.0.1:5000/mymusic/api/v1.0/users/";
}

@end
