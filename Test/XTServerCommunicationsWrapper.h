//
//  XTServerCommunicationsWrapper.h
//  Test
//
//  Created by Yurii Zadoianchuk on 10/12/13.
//  Copyright (c) 2013 Yurii Zadoianchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XTUserModel;

@interface XTServerCommunicationsWrapper : NSObject

+ (NSDictionary *)createUserWithUserModelDictionary:(NSDictionary *)userModelDictionary;
+ (NSDictionary *)authenticateUserWithUsername:(NSString * )username accessToken:(NSString *)accessToken;
+ (NSDictionary *)deleteUserWithUsername:(NSString *)username accessToken:(NSString *)accessToken;
+ (NSDictionary *)updateUserWithUsername:(NSString *)username accessToken:(NSString *)accessToken dictionary:(NSDictionary *)dictionary;

@end
