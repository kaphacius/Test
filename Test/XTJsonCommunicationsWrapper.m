//
//  XTJsonCommunicationsWrapper.m
//  Test
//
//  Created by Yurii Zadoianchuk on 10/12/13.
//  Copyright (c) 2013 Yurii Zadoianchuk. All rights reserved.
//

#import "XTJsonCommunicationsWrapper.h"

@implementation XTJsonCommunicationsWrapper

+ (NSData *)sendJsonData:(NSData *)jsonData toUrl:(NSString *)urlString withHttpMethod:(HttpMethod)httpMethod
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:5.0f];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:[self stringForHttpMethod:httpMethod]];

    [request setValue:[NSString stringWithFormat:@"%d", [jsonData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:jsonData];
    
    return [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL];
}

+ (NSString *)stringForHttpMethod:(HttpMethod)httpMethod
{
    switch (httpMethod)
    {
        case HttpMethodGet:
            return @"GET";
            break;
        case HttpMethodPost:
            return @"POST";
            break;
        case HttpMethodPut:
            return @"PUT";
            break;
        case HttpMethodDelete:
            return @"DELETE";
            break;
        default:
            break;
    }
    
    return nil;
}

@end
