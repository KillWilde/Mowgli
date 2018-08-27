//
//  CYUISelfDefineVC.m
//  Mowgli
//
//  Created by MegatronCY on 2018/8/12.
//  Copyright © 2018 MegatronCY. All rights reserved.
//

#import "CYUISelfDefineVC.h"

@interface CYUISelfDefineVC ()

@end

@implementation CYUISelfDefineVC

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    
    [self configNavBar];
}

-(void)configNavBar{
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake( 0, 0, 25, 25);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    leftBtn.imageView.contentMode = UIViewContentModeCenter;
    [leftBtn addTarget:self action:@selector(leftBarBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    
    UIBarButtonItem * spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -15;
    self.navigationItem.leftBarButtonItems = @[spaceItem,leftBarButtonItem];
    
    self.navigationItem.title = @"自定义UI控件";
}

-(void)leftBarBtnClicked:(UIButton *)btn{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
