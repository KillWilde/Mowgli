//
//  HomeListCell.m
//  Mowgli
//
//  Created by MegatronCY on 2018/8/15.
//  Copyright © 2018 MegatronCY. All rights reserved.
//

#import "HomeListCell.h"
#import <Masonry.h>

@implementation HomeListCell

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.myShadowView];
        [self addSubview:self.imageViewContnt];
        
        [self myLayout];
    }
    
    return self;
}
-(void)reduceContentAnimation:(BOOL)animation{
//    [UIView animateWithDuration:animation ? 0.5:0 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
//        [self.myShadowView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self).mas_offset(30);
//            make.right.equalTo(self).mas_offset(-30);
//            make.top.equalTo(self).mas_offset(30);
//            make.bottom.equalTo(self).mas_offset(-30);
//        }];
//
//        [self.imageViewContnt mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self).mas_offset(30);
//            make.right.equalTo(self).mas_offset(-30);
//            make.top.equalTo(self).mas_offset(30);
//            make.bottom.equalTo(self).mas_offset(-30);
//        }];
//    } completion:nil];
    [self.myShadowView.layer removeAllAnimations];
    [self.imageViewContnt.layer removeAllAnimations];
    
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.fromValue = [NSNumber numberWithFloat:1];
    scale.toValue = [NSNumber numberWithFloat:0.95];
    scale.duration = 0.3;
    scale.removedOnCompletion = NO;
    scale.fillMode = kCAFillModeForwards;
    scale.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.myShadowView.layer addAnimation:scale forKey:@"CYScale"];
    [self.imageViewContnt.layer addAnimation:scale forKey:@"CYScale"];
    
}

-(void)relargeContentAnimation:(BOOL)animation{
//    [UIView animateWithDuration:animation ? 0.5:0 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
//        [self.myShadowView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self).mas_offset(20);
//            make.right.equalTo(self).mas_offset(-20);
//            make.top.equalTo(self).mas_offset(20);
//            make.bottom.equalTo(self).mas_offset(-20);
//        }];
//
//        [self.imageViewContnt mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self).mas_offset(20);
//            make.right.equalTo(self).mas_offset(-20);
//            make.top.equalTo(self).mas_offset(20);
//            make.bottom.equalTo(self).mas_offset(-20);
//        }];
//    } completion:nil];
    [self.myShadowView.layer removeAllAnimations];
    [self.imageViewContnt.layer removeAllAnimations];
    
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.fromValue = [NSNumber numberWithFloat:0.95];
    scale.toValue = [NSNumber numberWithFloat:1];
    scale.duration = 0.3;
    scale.removedOnCompletion = NO;
    scale.fillMode = kCAFillModeForwards;
    scale.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.myShadowView.layer addAnimation:scale forKey:@"CYScale"];
    [self.imageViewContnt.layer addAnimation:scale forKey:@"CYScale"];
}

#pragma mark - Layout
-(void)myLayout{
    [self.myShadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).mas_offset(20);
        make.right.equalTo(self).mas_offset(-20);
        make.top.equalTo(self).mas_offset(20);
        make.bottom.equalTo(self).mas_offset(-20);
    }];
    
    [self.imageViewContnt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).mas_offset(20);
        make.right.equalTo(self).mas_offset(-20);
        make.top.equalTo(self).mas_offset(20);
        make.bottom.equalTo(self).mas_offset(-20);
    }];
}

#pragma mark - LazyLoad
-(UIView *)myShadowView{
    if (!_myShadowView) {
        _myShadowView = [[UIView alloc] init];
        _myShadowView.backgroundColor = [UIColor blackColor];
        _myShadowView.layer.cornerRadius = 10;
        _myShadowView.layer.shadowColor = [UIColor blackColor].CGColor;
        _myShadowView.layer.shadowOffset = CGSizeMake(10, 10);
        _myShadowView.layer.shadowOpacity = 0.9;
        _myShadowView.layer.shadowRadius = 5;
    }
    
    return _myShadowView;
}

-(UIImageView *)imageViewContnt{
    if (!_imageViewContnt) {
        _imageViewContnt = [[UIImageView alloc] init];
        _imageViewContnt.layer.cornerRadius = 10;
        _imageViewContnt.layer.masksToBounds = YES;
    }
    
    return _imageViewContnt;
}

@end
