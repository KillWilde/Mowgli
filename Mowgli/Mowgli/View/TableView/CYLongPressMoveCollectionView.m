//
//  CYLongPressMoveCollectionView.m
//  Mowgli
//
//  Created by SaturdayNight on 2018/9/8.
//  Copyright © 2018年 MegatronCY. All rights reserved.
//

#import "CYLongPressMoveCollectionView.h"

@interface CYLongPressMoveCollectionView () <UICollectionViewDelegate>

@property (nonatomic,assign) NSInteger lastIndexPathRow;
@property (nonatomic,assign) BOOL canEnd;           // make sure animation once

@end

@implementation CYLongPressMoveCollectionView

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
    }
    
    return self;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.endBlock && self.canEnd) {
        self.endBlock(self.lastIndexPathRow);
        self.canEnd = NO;
    }
}

#pragma mark - 自定义长按缩放手势 类似于AppStore中效果 点击缩放 移动后还原 开始滑动TableView
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self];
    NSIndexPath *indexPath = [self indexPathForItemAtPoint:point];
    self.lastIndexPathRow = indexPath.row;
    
    if (self.beginBlock) {
        self.beginBlock(indexPath.row);
        self.canEnd = YES;
    }
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self];
    NSIndexPath *indexPath = [self indexPathForItemAtPoint:point];
    
    if (self.endBlock && self.canEnd) {
        self.endBlock(indexPath.row);
        self.canEnd = NO;
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self];
    NSIndexPath *indexPath = [self indexPathForItemAtPoint:point];
    
    if (self.endBlock && self.canEnd) {
        self.endBlock(indexPath.row);
        self.canEnd = NO;
    }
}

@end
