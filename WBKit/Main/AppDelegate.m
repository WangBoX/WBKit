//
//  AppDelegate.m
//  WBKit
//
//  Created by ios on 2016/11/8.
//  Copyright © 2016年 WBO. All rights reserved.
//

#import "AppDelegate.h"
#import "WBRootViewController.h"
#import "WBMainTabController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setupTabBarController];
    
    return YES;
}

- (void)setupTabBarController{
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
    WBMainTabController *mainTab = [[WBMainTabController alloc] initWithNibName:nil bundle:nil];
    [self.window setRootViewController:mainTab];
}
@end

