//
//  XTServerCommunicationsWrapper.m
//  Test
//
//  Created by Yurii Zadoianchuk on 10/12/13.
//  Copyright (c) 2013 Yurii Zadoianchuk. All rights reserved.
//

static NSString * const kServerUrl = @"http://127.0.0.1:5000/mymusic/api/v1.0/users/";

#import "XTServerCommunicationsWrapper.h"
#import "XTJsonCommunicationsWrapper.h"

@implementation XTServerCommunicationsWrapper

+ (NSDictionary *)createUserWithUserModelDictionary:(NSDictionary *)userModelDictionary
{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:userModelDictionary
                                                       options:0
                                                         error:NULL];
    
    NSData *responseData = [XTJsonCommunicationsWrapper sendJsonData:jsonData
                                                               toUrl:kServerUrl
                                                      withHttpMethod:HttpMethodPost];
    
    return [NSJSONSerialization JSONObjectWithData:responseData
                                           options:0
                                             error:NULL];
}

+ (NSDictionary *)authenticateUserWithUserName:(NSString * )userName accessToken:(NSString *)accessToken
{
    
}

@end
