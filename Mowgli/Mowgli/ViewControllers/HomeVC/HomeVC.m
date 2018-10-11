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
#import "HomeListItemModel.h"
#import "CYLongPressMoveCollectionView.h"

static NSString *kHomeListCell = @"kHomeListCell";

@interface HomeVC () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) CYLongPressMoveCollectionView *homeList;
@property (nonatomic,strong) NSMutableArray <HomeListItemModel *>*datasource;

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
    return self.datasource.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HomeListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kHomeListCell forIndexPath:indexPath];
    cell.tag = 121;
    
    cell.imageViewContnt.image = [UIImage imageNamed:@"demoOne"];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"clicked indexPathRow %i",(int)indexPath.row);
}

#pragma mark - LazyLoad
-(UICollectionView *)homeList{
    if (!_homeList) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        
        layout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH * 0.7);
        _homeList = [[CYLongPressMoveCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [_homeList registerClass:[HomeListCell class] forCellWithReuseIdentifier:kHomeListCell];
        _homeList.delegate = self;
        _homeList.dataSource = self;
        _homeList.backgroundColor = [UIColor whiteColor];
        __weak typeof(self) weakSelf = self;
        _homeList.beginBlock = ^(NSInteger indexPathRow) {
            HomeListCell *cell = (HomeListCell *)[weakSelf.homeList cellForItemAtIndexPath:[NSIndexPath indexPathForRow:indexPathRow inSection:0]];
            [cell reduceContentAnimation:YES];
        };
        _homeList.endBlock = ^(NSInteger indexPathRow) {
            HomeListCell *cell = (HomeListCell *)[weakSelf.homeList cellForItemAtIndexPath:[NSIndexPath indexPathForRow:indexPathRow inSection:0]];
            [cell relargeContentAnimation:YES];
        };
    }
    
    return _homeList;
}

-(NSMutableArray *)datasource{
    if (!_datasource) {
        _datasource = [NSMutableArray arrayWithCapacity:0];
        
        for (int i = 0; i < 10; i ++) {
            HomeListItemModel *item = [[HomeListItemModel alloc] init];
            [_datasource addObject:item];
        }
        
    }
    
    return _datasource;
}

@end
