//
//  DisplayVC.m
//  Mowgli
//
//  Created by Tony Stark on 2018/9/21.
//  Copyright © 2018年 MegatronCY. All rights reserved.
//

#import "DisplayVC.h"
#import "RotateLoadingView.h"

@interface DisplayVC ()

@property (nonatomic,strong) RotateLoadingView *loadingView;

@end

@implementation DisplayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.loadingView = [[RotateLoadingView alloc] initWithFrame:CGRectMake(30, 200, 100, 100)];
}

@end
