//
//  XTAccessTokenStorageWrapper.m
//  Test
//
//  Created by Yurii Zadoianchuk on 10/12/13.
//  Copyright (c) 2013 Yurii Zadoianchuk. All rights reserved.
//

#import "XTAccessTokenStorageWrapper.h"

@implementation XTAccessTokenStorageWrapper

+ (void)saveAccessToken:(NSString *)accessToken forUsername:(NSString *)username
{
    NSMutableDictionary *dictionary = [self dictionaryForUsername:username];
    
    SecItemDelete((__bridge CFDictionaryRef)dictionary);
    
    dictionary[(__bridge id)kSecValueData] = [accessToken dataUsingEncoding:NSUTF8StringEncoding];
    
    SecItemAdd((__bridge CFDictionaryRef)(dictionary), NULL);
}

+ (NSString *)accessTokenForUsername:(NSString *)username
{
    NSMutableDictionary *dictionary = [self dictionaryForUsername:username];
    dictionary[(__bridge id)kSecReturnData] = (__bridge id)kCFBooleanTrue;
    
    CFDataRef found = NULL;
    
    SecItemCopyMatching((__bridge CFDictionaryRef)dictionary, (CFTypeRef *)&found);
    
    NSString *accessToken = nil;
    
    if (NULL != found)
    {
        accessToken = [[NSString alloc] initWithData:(__bridge NSData *)found encoding:NSUTF8StringEncoding];
    }
    
    return accessToken;
}

+ (void)deleteAccessTokenForUsername:(NSString *)username
{
    NSDictionary *dictionary = [self dictionaryForUsername:username];
    
    SecItemDelete((__bridge CFDictionaryRef)dictionary);
}

+ (NSMutableDictionary *)dictionaryForUsername:(NSString *)username
{
    return [@{ (__bridge id)kSecClass : (__bridge id)kSecClassGenericPassword,
               (__bridge id)kSecAttrService : username } mutableCopy];
}

@end
