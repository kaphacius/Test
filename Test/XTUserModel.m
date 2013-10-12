//
//  XTUserModel.m
//  Test
//
//  Created by Yurii Zadoianchuk on 10/12/13.
//  Copyright (c) 2013 Yurii Zadoianchuk. All rights reserved.
//

#import "XTUserModel.h"
#import "XTNonNilMutableDictionary.h"

static NSString * const kAccessTokenKey = @"access_token";
static NSString * const kEmailKey = @"email";
static NSString * const kFirstNameKey = @"first_name";
static NSString * const kIdKey = @"id";
static NSString * const kLastNameKey = @"last_name";
static NSString * const kUsernameKey = @"username";

@interface XTUserModel()
{
    XTNonNilMutableDictionary *_nonNilDictionary;
}

@end

#pragma mark -

@implementation XTUserModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (nil != self)
    {
        _nonNilDictionary = [[XTNonNilMutableDictionary alloc] initWithDictionary:dictionary];
        
        self.access_token = _nonNilDictionary[kAccessTokenKey];
        self.email = _nonNilDictionary[kEmailKey];
        self.first_name = _nonNilDictionary[kFirstNameKey];
        self.id = _nonNilDictionary[kIdKey];
        self.last_name = _nonNilDictionary[kLastNameKey];
        self.username = _nonNilDictionary[kUsernameKey];
    }
    
    return self;
}

+ (instancetype)objectWithDictionary:(NSDictionary *)dictionary
{
    return [[XTUserModel alloc] initWithDictionary:dictionary];
}

- (NSDictionary *)serialize
{
    _nonNilDictionary[kAccessTokenKey] = self.access_token;
    _nonNilDictionary[kEmailKey] = self.email;
    _nonNilDictionary[kFirstNameKey] = self.first_name;
    _nonNilDictionary[kIdKey] = self.id;
    _nonNilDictionary[kLastNameKey] = self.last_name;
    _nonNilDictionary[kUsernameKey] = self.username;
    
    return _nonNilDictionary.dictionary;
}

@end
