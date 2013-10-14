//
//  XTUserManagementWrapper.m
//  Test
//
//  Created by Yurii Zadoianchuk on 10/13/13.
//  Copyright (c) 2013 Yurii Zadoianchuk. All rights reserved.
//

#import "XTUserManagementWrapper.h"
#import "XTUserModel.h"
#import "XTServerCommunicationsWrapper.h"
#import "XTConstants.h"
#import "XTAccessTokenStorageWrapper.h"

@implementation XTUserManagementWrapper

+ (BOOL)createUserWithModel:(XTUserModel *)userModel
{
    BOOL result = NO;
    
    NSDictionary *returnDictionary = [XTServerCommunicationsWrapper createUserWithUserModelDictionary:[userModel serialize]];
    
    if (nil != returnDictionary[[XTConstants kUserKey]])
    {
        [userModel populateWithDictionary:returnDictionary[[XTConstants kUserKey]]];
        result = YES;
        
        [XTAccessTokenStorageWrapper saveAccessToken:userModel.access_token forUsername:userModel.username];
    }
    
    return result;
}

+ (BOOL)authenticateUserWithModel:(XTUserModel *)userModel
{
    BOOL result = NO;
    
    if (nil == userModel.access_token)
    {
        userModel.access_token = [XTAccessTokenStorageWrapper accessTokenForUsername:userModel.username];
    }
    
    if (nil != userModel.access_token)
    {
        NSDictionary *returnDictionary = [XTServerCommunicationsWrapper authenticateUserWithUsername:userModel.username
                                                                                         accessToken:userModel.access_token];
        
        if (nil != returnDictionary &&
            nil == returnDictionary[[XTConstants kErrorKey]])
        {
            result = YES;
            [userModel populateWithDictionary:returnDictionary];
        }
    }
    
    return result;
}

+ (BOOL)updateUserWithUserModel:(XTUserModel *)userModel
{
    BOOL result = NO;
    
    NSDictionary *jsonDictionary = @{ [XTConstants kLastNameKey] : userModel.last_name };
    
    NSDictionary *returnDictionary = [XTServerCommunicationsWrapper updateUserWithUsername:userModel.username
                                                                               accessToken:userModel.access_token
                                                                                dictionary:jsonDictionary];
    
    if (nil == returnDictionary[[XTConstants kErrorKey]])
    {
        result = YES;
    }
    
    return result;
}

+ (BOOL)deleteUserWithUserModel:(XTUserModel *)userModel
{
    BOOL result = NO;
    
    NSDictionary *returnDictionary = [XTServerCommunicationsWrapper deleteUserWithUsername:userModel.username
                                                                               accessToken:userModel.access_token];
    
    if (nil != returnDictionary[[XTConstants kOkKey]])
    {
        result = YES;
        [XTAccessTokenStorageWrapper deleteAccessTokenForUsername:userModel.username];
    }
    
    return result;
}

@end