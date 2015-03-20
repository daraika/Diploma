//
//  ViewController.m
//  QNADiploma
//
//  Created by Zhanserik Kenes on 21.02.15.
//  Copyright (c) 2015 Zhans Inc. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+Tints.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.navigationController.navigationBar setTranslucent:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) configurePage{
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
}

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    UILabel *titleView = (UILabel *)self.navigationItem.titleView;
    if (!titleView) {
        titleView = [[UILabel alloc] initWithFrame:CGRectZero];
        titleView.numberOfLines = 100;
        titleView.backgroundColor = [UIColor clearColor];
        titleView.font = [UIFont boldSystemFontOfSize:18.0f];
        [titleView setTextColor:[UIColor whiteColor]];
        self.navigationItem.titleView = titleView;
    }
    titleView.numberOfLines = 100;
    titleView.text = title;
    
    [titleView sizeToFit];
}

- (AppDelegate *) appDelegate{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}


@end
