//
//  WaterFallFlowLayout.m
//  CollectionViewTest
//
//  Created by 雷传营 on 16/6/2.
//  Copyright © 2016年 BrotherCompany. All rights reserved.
//

#import "WaterFallFlowLayout.h"


@interface WaterFallFlowLayout ()
{
    NSMutableArray * _attributeArray;
}
@end

@implementation WaterFallFlowLayout
-(void)prepareLayout{

    _attributeArray = [NSMutableArray array];
    [super prepareLayout];
    float WIDTH = ([UIScreen mainScreen].bounds.size.width-self.sectionInset.left-self.sectionInset.right-self.minimumInteritemSpacing)/2;
    CGFloat colHight[2] = {self.sectionInset.top,self.sectionInset.bottom};
    for (int i=0; i<_itemCount; i++) {
        
        NSIndexPath * index = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes * attribute =  [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:index];
        CGFloat height = arc4random()%150+40;
        int width = 0;
        if (colHight[0]<colHight[1]) {
            colHight[0] = colHight[0]+height+self.minimumLineSpacing;
            width = 0; 
        }else{
            colHight[1] = colHight[1]+height+self.minimumLineSpacing;
            width = 1;
        }
        attribute.frame = CGRectMake(self.sectionInset.left+(self.minimumInteritemSpacing+WIDTH)*width, colHight[width]-height-self.minimumLineSpacing, WIDTH, height);
        [_attributeArray addObject:attribute];
        
    }
    if (colHight[0]>colHight[1]) {
        self.itemSize = CGSizeMake(WIDTH, (colHight[0]-self.sectionInset.top)*2/_itemCount-self.minimumLineSpacing);
    }else{
        self.itemSize = CGSizeMake(WIDTH, (colHight[1]-self.sectionInset.top)*2/_itemCount-self.minimumLineSpacing);
    }

}
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return _attributeArray;
}

@end
