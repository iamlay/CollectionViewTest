//
//  CircleViewController.m
//  CollectionViewTest
//
//  Created by 雷传营 on 16/6/2.
//  Copyright © 2016年 BrotherCompany. All rights reserved.
//

#import "CircleViewController.h"
#import "CircleLayout.h"

@interface CircleViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
    
    UICollectionView * _collectionView;
}


@end

@implementation CircleViewController


-(void)viewDidLoad{
    
    self.view.backgroundColor  = [UIColor whiteColor];
    CircleLayout * layout      = [[CircleLayout alloc]init];
    _collectionView            = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    _collectionView.delegate   = self;
    _collectionView.dataSource = self;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    [self.view addSubview:_collectionView];
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    cell.backgroundColor        = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    cell.layer.masksToBounds    = YES;
    cell.layer.cornerRadius     = 25;
    return cell;
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

@end
