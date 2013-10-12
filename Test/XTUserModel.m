//
//  XTUserModel.m
//  Test
//
//  Created by Yurii Zadoianchuk on 10/12/13.
//  Copyright (c) 2013 Yurii Zadoianchuk. All rights reserved.
//

#import "XTUserModel.h"

static NSString * const kAccessTokenKey = @"access_token";
static NSString * const kEmailKey = @"email";
static NSString * const kFirstNameKey = @"first_name";
static NSString * const kIdKey = @"id";
static NSString * const kLastNameKey = @"last_name";
static NSString * const kUsernameKey = @"username";

@implementation XTUserModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (nil != self)
    {
        self.access_token = dictionary[kAccessTokenKey];
        self.email = dictionary[kEmailKey];
        self.first_name = dictionary[kFirstNameKey];
        self.id = dictionary[kIdKey];
        self.last_name = dictionary[kLastNameKey];
        self.username;
    }
    
    return self;
}

@end
