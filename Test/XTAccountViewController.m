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

@interface XTAccountViewController ()
{
    IBOutlet UITextField *_usernameTextField;
    IBOutlet UITextField *_firstNameTextField;
    IBOutlet UITextField *_lastNameTextField;
    IBOutlet UITextField *_emailTextField;
    IBOutlet UIButton *_registerButton;
    IBOutlet UIButton *_logOffButton;
}

- (IBAction)registerButtonTapped;
- (IBAction)logOffButtonTapped;

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

- (void)populateModelWithView
{
    _userModel.username = _usernameTextField.text;
    _userModel.first_name = _firstNameTextField.text;
    _userModel.last_name = _lastNameTextField.text;
    _userModel.email = _emailTextField.text;
}

- (BOOL)validateTextFields
{
    return nil != _usernameTextField.text &&
           nil != _firstNameTextField.text &&
           nil != _lastNameTextField.text &&
           nil != _emailTextField.text;
}

- (void)executeRegistration
{
    if (YES == [self validateTextFields])
    {
        [self populateModelWithView];
        [self registerUser];
    }
}

- (void)registerUser
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        BOOL result = [XTUserManagementWrapper createUserWithModel:_userModel];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self registrationCompletedWithResult:result];
        });
    });
}

- (void)registrationCompletedWithResult:(BOOL)result
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%i", result] message:nil delegate:nil cancelButtonTitle:@"1" otherButtonTitles:nil];
    
    [alertView show];
    
    if (YES == result)
    {
        _isInRegistrationMode = NO;
        [self setupView];
    }
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
}

- (IBAction)logOffButtonTapped
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end