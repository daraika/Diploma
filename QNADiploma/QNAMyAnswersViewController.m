//
//  MyAnswersViewController.m
//  QNADiploma
//
//  Created by Zhanserik Kenes on 21.02.15.
//  Copyright (c) 2015 Zhans Inc. All rights reserved.
//

#import "QNAMyAnswersViewController.h"

@implementation QNAMyAnswersViewController

#pragma mark - UIViewController Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"My Answers"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - SlidingNavigationController Delegate

- (BOOL)slideNavigationControllerShouldDisplayRightMenu{
    return NO;
}
- (BOOL)slideNavigationControllerShouldDisplayLeftMenu{
    return YES;
}

@end
