//
//  PersonalVC.m
//  Mowgli
//
//  Created by MegatronCY on 2018/8/12.
//  Copyright © 2018 MegatronCY. All rights reserved.
//

#import "PersonalVC.h"
#import "CYPanoramaCompoundView.h"
#import "CYColorPicManager.h"

@interface PersonalVC ()

@property (nonatomic,strong) CYPanoramaCompoundView *pView;

@end

@implementation PersonalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    [btn setTitle:@"个人中心" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.center = self.view.center;
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    self.pView = [[CYPanoramaCompoundView alloc] initWithFrame:CGRectMake(0, 200, 600, 600)];
    
    [self.view addSubview:self.pView];
    
    [self.view addSubview:btn];
}

-(void)click{
    CYColorPicManager *manager = [[CYColorPicManager alloc] init];
    [self.pView createPanorama:[manager getPicColorInfoImage:[UIImage imageNamed:@"demoOne"]]];
}

@end
