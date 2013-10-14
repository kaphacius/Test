//
//  XTBlockableViewController.m
//  Test
//
//  Created by Yurii Zadoianchuk on 10/14/13.
//  Copyright (c) 2013 Yurii Zadoianchuk. All rights reserved.
//

#import "XTBlockableViewController.h"
#import "XTUtils.h"

@interface XTBlockableViewController ()
{
    UIView *_blockingView;
}

@end

@implementation XTBlockableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _blockingView = [XTUtils blockingViewWithFrame:self.view.frame];
}

- (void)toggleViewEnabled:(BOOL)isEnabled
{
    self.view.userInteractionEnabled = isEnabled;
    
    if (YES == isEnabled)
    {
        [_blockingView removeFromSuperview];
    }
    else
    {
        [self.view addSubview:_blockingView];
    }
}

@end
