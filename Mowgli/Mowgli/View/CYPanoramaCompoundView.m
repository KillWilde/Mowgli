//
//  CYPanoramaCompoundView.m
//  Mowgli
//
//  Created by Tony Stark on 2018/9/12.
//  Copyright © 2018年 MegatronCY. All rights reserved.
//

#import "CYPanoramaCompoundView.h"

@interface CYPanoramaCompoundView ()

@property (nonatomic,strong) NSMutableArray *imageInfos;

@end

@implementation CYPanoramaCompoundView

-(void)createPanorama:(NSMutableArray *)info{
    self.imageInfos = [info mutableCopy];
    
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    NSInteger y= [self.imageInfos.firstObject count];
    NSInteger x = self.imageInfos.count;
    
    for (NSInteger a = 0; a < x; a++) {
        for (NSInteger b = 0; b < y; b++) {
            NSArray *arrayX = [self.imageInfos objectAtIndex:a];
            NSDictionary *dicInfo = [arrayX objectAtIndex:b];
            NSInteger red = [[dicInfo objectForKey:@"RED"] integerValue];
            NSInteger green = [[dicInfo objectForKey:@"GREEN"] integerValue];
            NSInteger blue = [[dicInfo objectForKey:@"BLUE"] integerValue];
            //设置颜色
            CGContextSetRGBStrokeColor(context, red / 255.0, green / 255.0, blue / 255.0, 1.0);
            //设置线条样式
            CGContextSetLineCap(context, kCGLineCapSquare);
            //设置线条粗细宽度
            CGContextSetLineWidth(context, 1.0);
            //开始一个起始路径
            CGContextBeginPath(context);
            //起始点设置为(0,0):注意这是上下文对应区域中的相对坐标，
            CGContextMoveToPoint(context, a, b);
//            //设置下一个坐标点
            CGContextAddLineToPoint(context, a, b);
            CGContextStrokePath(context);
        }
    }
}

@end
