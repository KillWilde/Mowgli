//
//  HomeListCell.h
//  Mowgli
//
//  Created by MegatronCY on 2018/8/15.
//  Copyright © 2018 MegatronCY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeListCell : UICollectionViewCell

@property (nonatomic,strong) UIImageView *imageViewContnt;
@property (nonatomic,strong) UIView *myShadowView;

-(void)reduceContentAnimation:(BOOL)animation;
-(void)relargeContentAnimation:(BOOL)animation;

@end
