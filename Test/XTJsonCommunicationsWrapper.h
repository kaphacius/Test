//
//  XTJsonCommunicationsWrapper.h
//  Test
//
//  Created by Yurii Zadoianchuk on 10/12/13.
//  Copyright (c) 2013 Yurii Zadoianchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, HttpMethod)
{
    HttpMethodGet,
    HttpMethodPost,
    HttpMethodPut,
    HttpMethodDelete
};

@interface XTJsonCommunicationsWrapper : NSObject

+ (NSData *)sendJsonData:(NSData *)jsonData toUrl:(NSString *)urlString withHttpMethod:(HttpMethod)httpMethod;

@end
