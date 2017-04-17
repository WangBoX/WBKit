
//  Created by 王博 on 16/7/21.
//  Copyright © 2016年 WBO. All rights reserved.
//

#import "WBMainTabController.h"
#import "WBNavViewController.h"
#import "WBRootViewController.h"


#define TabbarVC    @"vc"
#define TabbarTitle @"title"
#define TabbarImage @"image"
#define TabbarSelectedImage @"selectedImage"
#define TabbarItemBadgeValue @"badgeValue"
#define TabBarCount 4

#define kNotificationMaxLimit 1000


typedef NS_ENUM(NSInteger,TabType) {
    TabType0,
    TabType1,
    TabType2,
    TabType3,
};


@interface WBMainTabController ()
@property (nonatomic,copy)  NSDictionary *configs;

@end

@implementation WBMainTabController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSubNav];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setUpStatusBar];
    
}

-(void)viewWillLayoutSubviews
{
    self.view.frame = [UIScreen mainScreen].bounds;
}


- (NSArray*)tabbars{
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    for (NSInteger tabbar = 0; tabbar < TabBarCount; tabbar++) {
        [items addObject:@(tabbar)];
    }
    return items;
}

- (void)setUpSubNav{
    
    NSMutableArray *vcArray = [[NSMutableArray alloc] init];
    [self.tabbars enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSDictionary * item =[self vcInfoForTabType:[obj integerValue]];
        NSString *vcName = item[TabbarVC];
        NSString *title  = item[TabbarTitle];
        NSString *imageName = item[TabbarImage];
        NSString *imageSelected = item[TabbarSelectedImage];
        Class clazz = NSClassFromString(vcName);
        UIViewController *vc = [[clazz alloc] initWithNibName:nil bundle:nil];
        WBNavViewController *nav = [[WBNavViewController alloc] initWithRootViewController:vc];
        
        nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:title
                                                       image:[UIImage imageNamed:imageName]
                                               selectedImage:[UIImage imageNamed:imageSelected]];
        
        nav.tabBarItem.tag = idx;
        NSInteger badge = [item[TabbarItemBadgeValue] integerValue];
        if (badge) {
            NSString * unread = [NSString stringWithFormat:@"%zd",badge];
            nav.tabBarItem.badgeValue = unread;
        }
        [vcArray addObject:nav];
        
    }];
    self.viewControllers = [NSArray arrayWithArray:vcArray];
    
}


- (void)setUpStatusBar{
    UIStatusBarStyle style = UIStatusBarStyleLightContent;
    [[UIApplication sharedApplication] setStatusBarStyle:style
                                                animated:NO];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

#pragma mark - QPNavigationGestureHandlerDataSource
- (UINavigationController *)navigationController
{
    return self.selectedViewController;
}

#pragma mark - VC
- (NSDictionary *)vcInfoForTabType:(TabType)type{
    
    if (_configs == nil)
    {
        _configs = @{
                     @(TabType0) : @{
                             TabbarVC           : @"WBRootViewController",
                             TabbarTitle        : @"Kit",
                             TabbarImage        : @"tabbar_dating_normal",
                             TabbarSelectedImage: @"tabbar_dating_press",
                             TabbarItemBadgeValue: @(0)
                             },
                     @(TabType1)     : @{
                             TabbarVC           : @"WBRoot1ViewController",
                             TabbarTitle        : @"test1",
                             TabbarImage        : @"tabbar_xiaoxi_normal",
                             TabbarSelectedImage: @"tabbar_xiaoxi_press",
                             TabbarItemBadgeValue: @(10)
                             },
                     @(TabType2): @{
                             TabbarVC           : @"WBRoot2ViewController",
                             TabbarTitle        : @"test2",
                             TabbarImage        : @"tabbar_zhanji_normal",
                             TabbarSelectedImage: @"tabbar_zhanji_press",
                             },
                     @(TabType3)     : @{
                             TabbarVC           : @"WBRoot3ViewController",
                             TabbarTitle        : @"test3",
                             TabbarImage        : @"tabbar_wo_normal",
                             TabbarSelectedImage: @"tabbar_wo_press",
                             }
                     };
        
    }
    return _configs[@(type)];
}

@end

