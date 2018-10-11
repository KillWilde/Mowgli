//
//  CYLongPressMoveCollectionView.h
//  Mowgli
//
//  Created by SaturdayNight on 2018/9/8.
//  Copyright © 2018年 MegatronCY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CYPressBegin)(NSInteger indexPathRow);
typedef void(^CYPressEnd)(NSInteger indexPathRow);

@interface CYLongPressMoveCollectionView : UICollectionView

@property (nonatomic,copy) CYPressBegin beginBlock;
@property (nonatomic,copy) CYPressEnd endBlock;

@end
