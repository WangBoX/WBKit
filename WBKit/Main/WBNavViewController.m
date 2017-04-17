
//
//  WBNavViewController.m
//  WBKit
//
//  Created by WBO on 2017/2/14.
//  Copyright © 2017年 WBO. All rights reserved.
//

#import "WBNavViewController.h"

@interface WBNavViewController ()

@end

@implementation WBNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


@end
