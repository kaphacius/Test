//
//  XTUserModel.h
//  Test
//
//  Created by Yurii Zadoianchuk on 10/12/13.
//  Copyright (c) 2013 Yurii Zadoianchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XTUserModel : NSObject

@property (nonatomic, strong) NSString *access_token;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *first_name;
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *last_name;
@property (nonatomic, strong) NSString *username;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
+ (instancetype)objectWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)serialize;

@end

"user": {
"access_token": "dda568fe6781259a1f9b910c6704b4da",
"email": "maigfrga@gmail.com",
"first_name": "manuel",
"id": 1,
"last_name": "franco",
"username": "maigfrga"