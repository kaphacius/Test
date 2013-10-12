//
//  XTAccessTokenStorageWrapper.h
//  Test
//
//  Created by Yurii Zadoianchuk on 10/12/13.
//  Copyright (c) 2013 Yurii Zadoianchuk. All rights reserved.
//

@import Foundation;
@import Security;

@interface XTAccessTokenStorageWrapper : NSObject

+ (void)saveAccessToken:(NSString *)accessToken forUsername:(NSString *)username;
+ (NSString *)accessTokenForUsername:(NSString *)username;
+ (void)deleteAccessTokenForUsername:(NSString *)username;

@end
