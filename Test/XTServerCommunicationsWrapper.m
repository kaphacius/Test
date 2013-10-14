//
//  XTServerCommunicationsWrapper.m
//  Test
//
//  Created by Yurii Zadoianchuk on 10/12/13.
//  Copyright (c) 2013 Yurii Zadoianchuk. All rights reserved.
//

#import "XTServerCommunicationsWrapper.h"
#import "XTJsonCommunicationsWrapper.h"
#import "XTConstants.h"

@implementation XTServerCommunicationsWrapper

+ (NSDictionary *)createUserWithUserModelDictionary:(NSDictionary *)userModelDictionary
{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:userModelDictionary
                                                       options:0
                                                         error:NULL];
    
    return [self performServerCommunicationWithJsonData:jsonData
                                             httpMethod:HttpMethodPost httpHeaders:nil];
}

+ (NSDictionary *)authenticateUserWithUsername:(NSString * )username
                                   accessToken:(NSString *)accessToken
{
    NSDictionary *httpHeaders = [self dictionaryWithUsernameHeader:username
                                                 accessTokenHeader:accessToken];
    
    return [self performServerCommunicationWithJsonData:nil
                                             httpMethod:HttpMethodGet
                                            httpHeaders:httpHeaders];
}

+ (NSDictionary *)deleteUserWithUsername:(NSString *)username
                            accessToken:(NSString *)accessToken
{
    NSDictionary *httpHeaders = [self dictionaryWithUsernameHeader:username
                                                 accessTokenHeader:accessToken];
    
    return [self performServerCommunicationWithJsonData:nil
                                             httpMethod:HttpMethodDelete
                                            httpHeaders:httpHeaders];
}

+ (NSDictionary *)updateUserWithUsername:(NSString *)username accessToken:(NSString *)accessToken dictionary:(NSDictionary *)dictionary
{
    NSDictionary *httpHeaders = [self dictionaryWithUsernameHeader:username
                                                 accessTokenHeader:accessToken];
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary
                                                       options:0
                                                         error:NULL];
    
    return [self performServerCommunicationWithJsonData:jsonData
                                             httpMethod:HttpMethodPut
                                            httpHeaders:httpHeaders];
}

+ (NSDictionary *)performServerCommunicationWithJsonData:(NSData *)jsonData
                                              httpMethod:(HttpMethod)httpMethod
                                             httpHeaders:(NSDictionary *)httpHeaders
{
    NSData *responseData = [XTJsonCommunicationsWrapper sendJsonData:jsonData
                                                               toUrl:[XTConstants kServerUrl]
                                                      withHttpMethod:httpMethod
                                                         httpHeaders:httpHeaders];
    
    return [self dictionaryFromNonNilData:responseData];
}

+ (NSMutableDictionary *)dictionaryWithUsernameHeader:(NSString *)username
                                    accessTokenHeader:(NSString *)accessToken
{
    return [@{ [XTConstants kApiUsernameHeader] : username,
               [XTConstants kApiAccessTokenHeader] : accessToken} mutableCopy];
}

+ (NSDictionary *)dictionaryFromNonNilData:(NSData *)data
{
    return nil == data ? nil : [NSJSONSerialization JSONObjectWithData:data
                                                               options:0
                                                                 error:NULL];
}

@end