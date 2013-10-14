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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (XTAccountViewController *)instantiateAccountViewController
{
    return [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
            instantiateViewControllerWithIdentifier:
            NSStringFromClass([XTAccountViewController class])];
}

- (IBAction)authenticateButtonTapped
{

}

- (IBAction)registerButtonTapped
{
    _userModel.username = _usernameTextField.text;
    
    XTAccountViewController *accountVc = [self instantiateAccountViewController];
    accountVc.isInRegistrationMode = YES;
    accountVc.userModel = _userModel;
    
    [self.navigationController pushViewController:accountVc animated:YES];
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
