//
//  RotateLoadingView.h
//  Mowgli
//
//  Created by Tony Stark on 2018/9/21.
//  Copyright © 2018年 MegatronCY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RotateLoadingView : UIView

-(void)beginRotateAnticlockwise;
-(void)beginRotateClockwise;

-(void)showImage:(UIImage *)img;

@end

NS_ASSUME_NONNULL_END
