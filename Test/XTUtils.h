//
//  XTUtils.h
//  Test
//
//  Created by Yurii Zadoianchuk on 10/14/13.
//  Copyright (c) 2013 Yurii Zadoianchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XTUserModel;
@class XTBlockableViewController;

@interface XTUtils : NSObject

+ (void)showAlertViewWithTitle:(NSString *)title
                       message:(NSString *)message
             cancelButtonTitle:(NSString *)cancelButtonTitle
                 okButtonTitle:(NSString *)okButtonTitle
                      delegate:(id<UIAlertViewDelegate>)delegate;

+ (void)performBackgroundUserManagementOperation:(SEL)operation
                      forBlockableViewController:(XTBlockableViewController *)blockableVC
                                   withUserModel:(XTUserModel *)userModel
                                         handler:(SEL)handler;

+ (UIView *)blockingViewWithFrame:(CGRect)frame;

@end