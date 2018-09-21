//
//  RotateLoadingView.m
//  Mowgli
//
//  Created by Tony Stark on 2018/9/21.
//  Copyright © 2018年 MegatronCY. All rights reserved.
//

#import "RotateLoadingView.h"

@interface RotateLoadingView ()

@property (nonatomic,strong) UIImageView *imageViewIcon;
@property (nonatomic,strong) UIImageView *imageViewContent;

@end

@implementation RotateLoadingView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageViewIcon.frame = frame;
        self.imageViewContent.frame = frame;
        
        [self addSubview:self.imageViewContent];
        [self addSubview:self.imageViewIcon];
    }
    
    return self;
}

-(void)beginRotateAnticlockwise{
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAnimation.fromValue = [NSNumber numberWithFloat:M_PI * 2];
    rotateAnimation.toValue = [NSNumber numberWithFloat:0];
    rotateAnimation.duration = 1;
    rotateAnimation.removedOnCompletion = NO;
    rotateAnimation.fillMode = kCAFillModeForwards;
    
    self.imageViewIcon.alpha = 1;
    [self.imageViewIcon.layer removeAllAnimations];
    [self.imageViewIcon.layer addAnimation:rotateAnimation forKey:@"CYAnticlockwise"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self beginRotateClockwise];
    });
}

-(void)beginRotateClockwise{
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:M_PI * 2];
    rotateAnimation.duration = 0.8;
    rotateAnimation.removedOnCompletion = NO;
    rotateAnimation.fillMode = kCAFillModeForwards;
    rotateAnimation.repeatCount = MAXFLOAT;
    
    [self.imageViewIcon.layer removeAllAnimations];
    [self.imageViewIcon.layer addAnimation:rotateAnimation forKey:@"CYClockwise"];
}

-(void)showImage:(UIImage *)img{
    self.imageViewContent.image = img;
    self.imageViewIcon.alpha = 0;
    [self.imageViewContent.layer removeAllAnimations];
    [self.imageViewIcon.layer removeAllAnimations];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:M_PI * 2];
    rotateAnimation.duration = 2.f;
    rotateAnimation.removedOnCompletion = NO;
    rotateAnimation.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *alph = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alph.fromValue = [NSNumber numberWithFloat:1];
    alph.toValue = [NSNumber numberWithFloat:0];
    alph.duration = 2.f;
    alph.removedOnCompletion = NO;
    alph.fillMode = kCAFillModeForwards;
    
    group.animations = @[alph,rotateAnimation];
    
    CAAnimationGroup *group2 = [CAAnimationGroup animation];
    
    CABasicAnimation *rotateAnimation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAnimation2.fromValue = [NSNumber numberWithFloat:M_PI * 6];
    rotateAnimation2.toValue = [NSNumber numberWithFloat:0];
    rotateAnimation2.duration = 2.f;
    rotateAnimation2.removedOnCompletion = NO;
    rotateAnimation2.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.fromValue = [NSNumber numberWithFloat:0.2];
    scale.toValue = [NSNumber numberWithFloat:1];
    scale.duration = 2.f;
    scale.removedOnCompletion = NO;
    scale.fillMode = kCAFillModeForwards;
    
    group2.animations = @[rotateAnimation2,scale];
    
    
    [self.imageViewIcon.layer addAnimation:group forKey:nil];
    [self.imageViewContent.layer addAnimation:group2 forKey:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.imageViewContent.layer removeAllAnimations];
//        [self.imageViewIcon.layer removeAllAnimations];
 //       [self.imageViewIcon removeFromSuperview];
    });
}

#pragma mark - lazy load
-(UIImageView *)imageViewIcon{
    if (!_imageViewIcon) {
        _imageViewIcon = [[UIImageView alloc] init];
        _imageViewIcon.image = [UIImage imageNamed:@"loading.png"];
    }
    
    return _imageViewIcon;
}

-(UIImageView *)imageViewContent{
    if (!_imageViewContent) {
        _imageViewContent = [[UIImageView alloc] init];
    }
    
    return _imageViewContent;
}

@end
