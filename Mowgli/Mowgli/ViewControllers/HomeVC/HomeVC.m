//
//  HomeVC.m
//  Mowgli
//
//  Created by MegatronCY on 2018/8/12.
//  Copyright © 2018 MegatronCY. All rights reserved.
//

#import "HomeVC.h"
#import "HomeListCell.h"
#import <Masonry.h>

static NSString *kHomeListCell = @"kHomeListCell";

@interface HomeVC () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *homeList;
@property (nonatomic,strong) NSMutableArray *datasource;

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.homeList];
    
    [self myLayout];
}

#pragma mark - Layout
-(void)myLayout{
    [self.homeList mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

#pragma mark - Delegate
#pragma mark UICollectionDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HomeListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kHomeListCell forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - LazyLoad
-(UICollectionView *)homeList{
    if (!_homeList) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        
        layout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH * 0.7);
        _homeList = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [_homeList registerClass:[HomeListCell class] forCellWithReuseIdentifier:kHomeListCell];
        _homeList.delegate = self;
        _homeList.dataSource = self;
        _homeList.backgroundColor = [UIColor whiteColor];
    }
    
    return _homeList;
}

@end
