//
//  PersonalVC.m
//  Mowgli
//
//  Created by MegatronCY on 2018/8/12.
//  Copyright © 2018 MegatronCY. All rights reserved.
//

#import "PersonalVC.h"

@interface PersonalVC ()

@end

@implementation PersonalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    [btn setTitle:@"个人中心" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.center = self.view.center;
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

-(void)click{
    
}

@end
