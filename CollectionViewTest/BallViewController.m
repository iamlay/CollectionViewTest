//
//  BallViewController.m
//  CollectionViewTest
//
//  Created by 雷传营 on 16/6/2.
//  Copyright © 2016年 BrotherCompany. All rights reserved.
//

#import "BallViewController.h"
#import "BallFlowLayout.h"

@interface BallViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>{
    
    UICollectionView * _collectionview;
}


@end
@implementation BallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    BallFlowLayout * layout = [[BallFlowLayout alloc]init];
 _collectionview  = [[UICollectionView alloc]initWithFrame:CGRectMake(50, 100, 320, 400) collectionViewLayout:layout];
   _collectionview.delegate=self;
    _collectionview.dataSource=self;
    //这里设置的偏移量是为了无缝进行循环的滚动，具体在上一篇博客中有解释
 _collectionview.contentOffset = CGPointMake(320, 400);
    [_collectionview registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    [self.view addSubview:_collectionview];
//    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(chageContentOffset) userInfo:nil repeats:YES];
}


//-(void)chageContentOffset{
//
//    _collectionview.contentOffset = CGPointMake(arc4random()%(11*400), arc4random()%(10*320));
//}
//

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//我们返回30的标签
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 30;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    label.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    [cell.contentView addSubview:label];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//这里对滑动的contentOffset进行监控，实现循环滚动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y<200) {
        scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, scrollView.contentOffset.y+10*400);
    }else if(scrollView.contentOffset.y>11*400){
        scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, scrollView.contentOffset.y-10*400);
    }
    if (scrollView.contentOffset.x<160) {
        scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x+10*320,scrollView.contentOffset.y);
    }else if(scrollView.contentOffset.x>11*320){
        scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x-10*320,scrollView.contentOffset.y);
    }
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"%ld====row",indexPath.row);
}



@end
