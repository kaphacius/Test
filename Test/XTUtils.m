//
//  XTUtils.m
//  Test
//
//  Created by Yurii Zadoianchuk on 10/14/13.
//  Copyright (c) 2013 Yurii Zadoianchuk. All rights reserved.
//

#import "XTUtils.h"
#import "XTUserModel.h"
#import "XTUserManagementWrapper.h"
#import "XTConstants.h"
#import "XTBlockableViewController.h"

@implementation XTUtils

+ (void)showAlertViewWithTitle:(NSString *)title
                       message:(NSString *)message
             cancelButtonTitle:(NSString *)cancelButtonTitle
                 okButtonTitle:(NSString *)okButtonTitle
                      delegate:(id<UIAlertViewDelegate>)delegate
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:delegate
                                              cancelButtonTitle:cancelButtonTitle
                                              otherButtonTitles:okButtonTitle, nil];
    [alertView show];
}

+ (void)performBackgroundUserManagementOperation:(SEL)operation
                      forBlockableViewController:(XTBlockableViewController *)blockableVC
                                   withUserModel:(XTUserModel *)userModel
                                         handler:(SEL)handler
{
    [blockableVC toggleViewEnabled:NO];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        BOOL result = (BOOL)[XTUserManagementWrapper performSelector:operation withObject:userModel];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [blockableVC toggleViewEnabled:YES];
            
            NSMethodSignature *signature = [[blockableVC class] instanceMethodSignatureForSelector:handler];
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
            invocation.target = blockableVC;
            invocation.selector = handler;
            [invocation setArgument:(void *)&result atIndex:2];
            
            [invocation invoke];
        });
    });
}

+ (UIView *)blockingViewWithFrame:(CGRect)frame
{
    UIView *blockingView = [[NSBundle mainBundle] loadNibNamed:[XTConstants kBlockingViewNibName] owner:nil options:nil][0];
    blockingView.frame = frame;
    blockingView.tag = [XTConstants kBlockingViewTag];
    
    return blockingView;
}

@end
