//
//  XTAccountViewController.m
//  Test
//
//  Created by Yurii Zadoianchuk on 10/13/13.
//  Copyright (c) 2013 Yurii Zadoianchuk. All rights reserved.
//

#import "XTAccountViewController.h"
#import "XTUserModel.h"
#import "XTUserManagementWrapper.h"
#import "XTUtils.h"
#import "XTConstants.h"

@interface XTAccountViewController ()
{
    IBOutlet UITextField *_usernameTextField;
    IBOutlet UITextField *_firstNameTextField;
    IBOutlet UITextField *_lastNameTextField;
    IBOutlet UITextField *_emailTextField;
    IBOutlet UIButton *_registerButton;
    IBOutlet UIButton *_logOffButton;
    IBOutlet UIButton *_deleteButton;
}

- (IBAction)registerButtonTapped;
- (IBAction)logOffButtonTapped;
- (IBAction)deleteButtonTapped;

@end

@implementation XTAccountViewController

- (void)setupWithUserModel:(XTUserModel *)userModel
        isRegistrationMode:(BOOL)isRegistrationMode
{
    _usernameTextField.enabled = isRegistrationMode;
    _firstNameTextField.enabled = isRegistrationMode;
    _emailTextField.enabled = isRegistrationMode;
    _logOffButton.hidden = isRegistrationMode;
    
    [self populateViewWithUserModel];
}

- (void)setupView
{
    _usernameTextField.enabled = _isInRegistrationMode;
    _firstNameTextField.enabled = _isInRegistrationMode;
    _emailTextField.enabled = _isInRegistrationMode;
    _logOffButton.hidden = _isInRegistrationMode;
    _deleteButton.hidden = _isInRegistrationMode;
    
    [_registerButton setTitle:_isInRegistrationMode ? @"Register" : @"Update" forState:UIControlStateNormal];
    
    [self populateViewWithUserModel];
}

- (void)populateViewWithUserModel
{
    _usernameTextField.text = _userModel.username;
    _firstNameTextField.text = _userModel.first_name;
    _lastNameTextField.text = _userModel.last_name;
    _emailTextField.text = _userModel.email;
}

- (void)populateUserModelWithView
{
    _userModel.username = _usernameTextField.text;
    _userModel.first_name = _firstNameTextField.text;
    _userModel.last_name = _lastNameTextField.text;
    _userModel.email = _emailTextField.text;
}

- (BOOL)validateTextFields
{
    return 0 != _usernameTextField.text.length &&
           0 != _firstNameTextField.text.length &&
           0 != _lastNameTextField.text.length &&
           0 != _emailTextField.text.length;
}

- (void)deleteUser
{
    [XTUtils performBackgroundUserManagementOperation:@selector(deleteUserWithUserModel:)
                           forBlockableViewController:self
                                        withUserModel:_userModel
                                              handler:@selector(deleteCompletedWithResult:)];
}

- (void)deleteCompletedWithResult:(BOOL)result
{
    if (YES == result)
    {
        [self displaySuccessAlertView];
        [self.navigationController popViewControllerAnimated:YES];
        [_userModel populateWithDictionary:nil];
    }
    else
    {
        [self displayFailureAlertView];
    }
}

- (void)executeUserUpdate
{
    if (YES == [self validateTextFields])
    {
        [self populateUserModelWithView];
        [self updateUser];
    }
    else
    {
        [XTUtils showAlertViewWithTitle:[XTConstants kFailureMessage]
                                message:[XTConstants kMandatoryFieldsMessage]
                      cancelButtonTitle:[XTConstants kOkButtonTitle]
                          okButtonTitle:nil
                               delegate:nil];
    }
}

- (void)updateUser
{
    [XTUtils performBackgroundUserManagementOperation:@selector(updateUserWithUserModel:)
                           forBlockableViewController:self
                                        withUserModel:_userModel
                                              handler:@selector(updateCompletedWithResult:)];
}

- (void)updateCompletedWithResult:(BOOL)result
{
    if (YES == result)
    {
        [self displaySuccessAlertView];
        [self populateViewWithUserModel];
    }
    else
    {
        [self displayFailureAlertView];
    }
}

- (void)executeRegistration
{
    if (YES == [self validateTextFields])
    {
        [self populateUserModelWithView];
        [self registerUser];
    }
    else
    {
        [XTUtils showAlertViewWithTitle:[XTConstants kFailureMessage]
                                message:[XTConstants kMandatoryFieldsMessage]
                      cancelButtonTitle:[XTConstants kOkButtonTitle]
                          okButtonTitle:nil
                               delegate:nil];
    }
}

- (void)registerUser
{
    [XTUtils performBackgroundUserManagementOperation:@selector(createUserWithModel:)
                           forBlockableViewController:self
                                        withUserModel:_userModel
                                              handler:@selector(registrationCompletedWithResult:)];
}

- (void)registrationCompletedWithResult:(BOOL)result
{
    if (YES == result)
    {
        [self displaySuccessAlertView];
        _isInRegistrationMode = NO;
        [self setupView];
    }
    else
    {
        [self displayFailureAlertView];
    }
}

- (void)displaySuccessAlertView
{
    [XTUtils showAlertViewWithTitle:[XTConstants kSuccessMesage]
                            message:[XTConstants kSuccessMesage]
                  cancelButtonTitle:[XTConstants kOkButtonTitle]
                      okButtonTitle:nil delegate:nil];
}

- (void)displayFailureAlertView
{
    
    [XTUtils showAlertViewWithTitle:[XTConstants kFailureMessage]
                            message:[XTConstants kFailureMessage]
                  cancelButtonTitle:[XTConstants kOkButtonTitle]
                      okButtonTitle:nil delegate:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self setupView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registerButtonTapped
{
    if (YES == _isInRegistrationMode)
    {
        [self executeRegistration];
    }
    else
    {
        [self executeUserUpdate];
    }
}

- (IBAction)logOffButtonTapped
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)deleteButtonTapped
{
    [XTUtils showAlertViewWithTitle:@"Delete user"
                            message:@"Are you sure?"
                  cancelButtonTitle:[XTConstants kCancelButtonTitle]
                      okButtonTitle:[XTConstants kOkButtonTitle]
                           delegate:self];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if ([XTConstants kOkButtonIndex] == buttonIndex)
    {
        [self deleteUser];
    }
}

@end