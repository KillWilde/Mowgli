//
//  UINavigationBar+FixBorderSpace.m
//  Mowgli
//
//  Created by MegatronCY on 2018/8/12.
//  Copyright © 2018 MegatronCY. All rights reserved.
//

#import "UINavigationBar+FixBorderSpace.h"
#import <objc/runtime.h>

@implementation UINavigationBar (FixBorderSpace)

+(void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originMethod = class_getInstanceMethod(self, @selector(layoutSubviews));
        Method destMethod = class_getInstanceMethod(self, @selector(cyLayoutSubviews));
        
        method_exchangeImplementations(originMethod, destMethod);
    });
}


// iOS11 导航栏按钮偏移问题解决 屏蔽系统的布局约束
-(void)cyLayoutSubviews{
    [self cyLayoutSubviews];
    
    CGFloat systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (systemVersion >= 11) {
        CGFloat space = 0;
        for (UIView *subview in self.subviews) {
            if ([NSStringFromClass(subview.class) containsString:@"ContentView"]) {
                subview.layoutMargins = UIEdgeInsetsMake(0, space, 0, space);//可修正iOS11之后的偏移
                break;
            }
        }
    }
}

@end
