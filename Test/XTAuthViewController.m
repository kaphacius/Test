//
//  XTAuthViewController.m
//  Test
//
//  Created by Yurii Zadoianchuk on 10/13/13.
//  Copyright (c) 2013 Yurii Zadoianchuk. All rights reserved.
//

#import "XTAuthViewController.h"
#import "XTAccountViewController.h"
#import "XTUserModel.h"
#import "XTUserManagementWrapper.h"
#import "XTUtils.h"
#import "XTConstants.h"

@interface XTAuthViewController ()
{
    IBOutlet UITextField *_usernameTextField;

    XTUserModel *_userModel;
}

- (IBAction)authenticateButtonTapped;
- (IBAction)registerButtonTapped;

@end

@implementation XTAuthViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _userModel = [[XTUserModel alloc] init];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    _usernameTextField.text = _userModel.username;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)authenticationCompletedWithResult:(BOOL)result
{
    if (YES == result)
    {
        XTAccountViewController *accountVC = [self displayAccountViewController];
        accountVC.userModel = _userModel;
        accountVC.isInRegistrationMode = NO;
    }
    else
    {
        [XTUtils showAlertViewWithTitle:[XTConstants kFailureMessage]
                                message:[XTConstants kFailureMessage]
                      cancelButtonTitle:[XTConstants kOkButtonTitle]
                          okButtonTitle:nil delegate:nil];
    }
}

- (XTAccountViewController *)displayAccountViewController
{
    XTAccountViewController *accountVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
                                          instantiateViewControllerWithIdentifier:
                                          NSStringFromClass([XTAccountViewController class])];
    
    [self.navigationController pushViewController:accountVC animated:YES];
     
     return accountVC;
}

- (BOOL)validateTextFields
{
    return 0 != _usernameTextField.text.length;
}

- (void)executeAuthentication
{
    [XTUtils performBackgroundUserManagementOperation:@selector(authenticateUserWithModel:)
                           forBlockableViewController:self
                                        withUserModel:_userModel
                                              handler:@selector(authenticationCompletedWithResult:)];
}

- (IBAction)authenticateButtonTapped
{
    if (YES == [self validateTextFields])
    {
        [self executeAuthentication];
    }
    else
    {
        [XTUtils showAlertViewWithTitle:[XTConstants kFailureMessage]
                                message:[XTConstants kMandatoryFieldsMessage]
                      cancelButtonTitle:[XTConstants kOkButtonTitle]
                          okButtonTitle:nil delegate:nil];
    }
}

- (IBAction)registerButtonTapped
{
    _userModel.username = _usernameTextField.text;
    
    XTAccountViewController *accountVC = [self displayAccountViewController];
    accountVC.isInRegistrationMode = YES;
    accountVC.userModel = _userModel;
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (_usernameTextField == textField)
    {
        _userModel.username = textField.text;
    }
}

@end