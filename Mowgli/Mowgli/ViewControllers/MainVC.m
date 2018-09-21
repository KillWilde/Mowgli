//
//  MainVC.m
//  Mowgli
//
//  Created by MegatronCY on 2018/8/9.
//  Copyright © 2018 MegatronCY. All rights reserved.
//

#import "MainVC.h"
#import "HomeVC.h"
#import "PersonalVC.h"
#import "DisplayVC/DisplayVC.h"

@interface MainVC ()

@end

@implementation MainVC

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    HomeVC *homeVC = [[HomeVC alloc] init];
    homeVC.tabBarItem.title = @"首页";
    homeVC.tabBarItem.image = [UIImage imageNamed:@"home_icon"];
    
    DisplayVC *displayVC = [[DisplayVC alloc] init];
    displayVC.tabBarItem.title = @"展示";
    
    PersonalVC *personalVC = [[PersonalVC alloc] init];
    personalVC.tabBarItem.title = @"我的";
    personalVC.tabBarItem.image = [UIImage imageNamed:@"personal_icon"];
    
    self.viewControllers = @[homeVC,displayVC,personalVC];
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSLog(@"你选择了 %@",item.title);
}

@end
