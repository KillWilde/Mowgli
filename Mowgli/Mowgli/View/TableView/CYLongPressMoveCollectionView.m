//
//  CYLongPressMoveCollectionView.m
//  Mowgli
//
//  Created by SaturdayNight on 2018/9/8.
//  Copyright © 2018年 MegatronCY. All rights reserved.
//

#import "CYLongPressMoveCollectionView.h"

@implementation CYLongPressMoveCollectionView

#pragma mark - 自定义长按缩放手势 类似于AppStore中效果 点击缩放 移动后还原 开始滑动TableView
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self];
    NSIndexPath *indexPath = [self indexPathForItemAtPoint:point];
    
    NSLog(@"CY indexPath.row = %li",indexPath.row);
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

@end
