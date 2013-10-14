//
//  XTAccountViewController.h
//  Test
//
//  Created by Yurii Zadoianchuk on 10/13/13.
//  Copyright (c) 2013 Yurii Zadoianchuk. All rights reserved.
//

#import "XTBlockableViewController.h"

@class XTUserModel;

@interface XTAccountViewController : XTBlockableViewController <UITextFieldDelegate, UIAlertViewDelegate>

@property (nonatomic, strong) XTUserModel *userModel;
@property (nonatomic) BOOL isInRegistrationMode;

@end
