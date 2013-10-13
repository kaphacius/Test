//
//  XTUserModel.m
//  Test
//
//  Created by Yurii Zadoianchuk on 10/12/13.
//  Copyright (c) 2013 Yurii Zadoianchuk. All rights reserved.
//

#import "XTUserModel.h"
#import "XTNonNilMutableDictionary.h"
#import "XTConstants.h"

@interface XTUserModel()
{
    XTNonNilMutableDictionary *_nonNilDictionary;
}

@end

#pragma mark -

@implementation XTUserModel

- (instancetype)init
{
    return [self initWithDictionary:nil];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (nil != self)
    {
        _nonNilDictionary = [[XTNonNilMutableDictionary alloc] initWithDictionary:dictionary];
        
        if (nil != dictionary)
        {
            [self populateWithNonNilDictionary];
        }
    }
    
    return self;
}

- (void)populateWithNonNilDictionary
{
    self.access_token = _nonNilDictionary[[XTConstants kAccessTokenKey]];
    self.email = _nonNilDictionary[[XTConstants kEmailKey]];
    self.first_name = _nonNilDictionary[[XTConstants kFirstNameKey]];
    self.id = _nonNilDictionary[[XTConstants kIdKey]];
    self.last_name = _nonNilDictionary[[XTConstants kLastNameKey]];
    self.username = _nonNilDictionary[[XTConstants kUsernameKey]];
}

+ (instancetype)objectWithDictionary:(NSDictionary *)dictionary
{
    return [[XTUserModel alloc] initWithDictionary:dictionary];
}

- (NSDictionary *)serialize
{
    _nonNilDictionary[[XTConstants kUsernameKey]] = self.access_token;
    _nonNilDictionary[[XTConstants kEmailKey]] = self.email;
    _nonNilDictionary[[XTConstants kFirstNameKey]] = self.first_name;
    _nonNilDictionary[[XTConstants kIdKey]] = self.id;
    _nonNilDictionary[[XTConstants kLastNameKey]] = self.last_name;
    _nonNilDictionary[[XTConstants kUsernameKey]] = self.username;
    
    return _nonNilDictionary.dictionary;
}

- (void)populateWithDictionary:(NSDictionary *)dictionary
{
    _nonNilDictionary = [[XTNonNilMutableDictionary alloc] initWithDictionary:dictionary];
    [self populateWithNonNilDictionary];
}

@end
