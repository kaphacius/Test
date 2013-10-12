//
//  XTNonNilMutableDictionary.h
//  Test
//
//  Created by Yurii Zadoianchuk on 10/12/13.
//  Copyright (c) 2013 Yurii Zadoianchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XTNonNilMutableDictionary : NSObject

@property (nonatomic, readonly) NSMutableDictionary *dictionary;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (id)objectForKeyedSubscript:(id <NSCopying>)key;
- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key;

@end
