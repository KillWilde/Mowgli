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
        self.backgroundColor = [UIColor blackColor];
        [self addSubview:self.imageViewContnt];
        
        [self myLayout];
    }
    
    return self;
}

#pragma mark - Layout
-(void)myLayout{
    [self.imageViewContnt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self);
        make.bottom.equalTo(self).mas_offset(-30);
    }];
}

#pragma mark - LazyLoad
-(UIImageView *)imageViewContnt{
    if (!_imageViewContnt) {
        _imageViewContnt = [[UIImageView alloc] init];
        _imageViewContnt.backgroundColor = [UIColor redColor];
    }
    
    return _imageViewContnt;
}

@end
