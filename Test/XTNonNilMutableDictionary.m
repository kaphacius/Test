//
//  XTNonNilMutableDictionary.m
//  Test
//
//  Created by Yurii Zadoianchuk on 10/12/13.
//  Copyright (c) 2013 Yurii Zadoianchuk. All rights reserved.
//

#import "XTNonNilMutableDictionary.h"

@interface XTNonNilMutableDictionary()
{
    NSMutableDictionary *_dictionary;
}

@end

@implementation XTNonNilMutableDictionary

- (instancetype)init
{
    return [self initWithDictionary:nil];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (nil != self)
    {
        _dictionary = [dictionary mutableCopy];
    }
    
    return self;
}

- (id)objectForKeyedSubscript:(id<NSCopying>)key
{
    return _dictionary[key] == [NSNull null] ? nil : key;
}

- (void)setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key
{
    _dictionary[key] = nil == obj ? [NSNull null] : obj;
}

@end
