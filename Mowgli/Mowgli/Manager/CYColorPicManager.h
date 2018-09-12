//
//  CYColorPicManager.h
//  Mowgli
//
//  Created by Tony Stark on 2018/9/12.
//  Copyright © 2018年 MegatronCY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CYColorPicManager : NSObject

-(UIColor *)getColorAtPoint:(CGPoint)point iamge:(UIImage *)img;

// 返回颜色值的一个二维数组 数组元素为NSDictionary key RED BLUE GREEN
-(NSMutableArray *)getPicColorInfoImage:(UIImage *)img;

@end
