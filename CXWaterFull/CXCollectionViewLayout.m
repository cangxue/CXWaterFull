//
//  CXCollectionViewLayout.m
//  CXWaterFull
//
//  Created by xiaoma on 16/7/27.
//  Copyright © 2016年 xiaoma. All rights reserved.
//

#import "CXCollectionViewLayout.h"
@interface CXCollectionViewLayout()

/*!
 @property
 @brief 存放最大高度
 */
@property (nonatomic, strong) NSMutableDictionary *maxYdic;

@end

@implementation CXCollectionViewLayout

- (NSMutableDictionary *)maxYdic {
    if (!_maxYdic) {
        self.maxYdic = [[NSMutableDictionary alloc] init];
    }
    
    return _maxYdic;
}
//初始化信息
- (instancetype)init {
    if (self = [super init]) {
        self.colMagrin = 10;
        self.rowMagrin = 10;
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        self.colCount = 3;
    }
    return self;
}

- (void)prepareLayout {
    [super prepareLayout];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (CGSize)collectionViewContentSize {
    __block NSString *maxCol = @"0";
    //获取最短列
    [self.maxYdic enumerateKeysAndObjectsUsingBlock:^(NSString *column, NSNumber *maxY, BOOL * _Nonnull stop) {
        if ([maxY floatValue] > [self.maxYdic[maxCol] floatValue]) {
            maxCol = column;
        }
    }];
    
    return CGSizeMake(0, [self.maxYdic[maxCol] floatValue]);
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    __block NSString * minCol = @"0";
    //找出最短的列
    [self.maxYdic enumerateKeysAndObjectsUsingBlock:^(NSString * column, NSNumber *maxY, BOOL *stop) {
        if ([maxY floatValue]<[self.maxYdic[minCol] floatValue]) {
            minCol = column;
        }
    }];
    
    //计算宽度
    CGFloat width = (self.collectionView.frame.size.width - self.sectionInset.left - self.sectionInset.right - (self.colCount - 1) * self.colMagrin)/self.colCount;
    
//    //    计算宽度
//    CGFloat width = (self.collectionView.frame.size.width-self.sectionInset.left-self.sectionInset.right-(self.colCount-1)*self.colMagrin)/self.colCount;
    
    //计算高度
    CGFloat height = [self.delegate CXWaterFlow:self heightForWidth:width atIndexPath:indexPath];
    
    //计算坐标
    CGFloat x = self.sectionInset.left + (width + self.colMagrin) * [minCol intValue];
    CGFloat y = [self.maxYdic[minCol] floatValue] + self.rowMagrin;
    
    //更新最大y值
    self.maxYdic[minCol] = @(y + height);
    
    //计算位置
    UICollectionViewLayoutAttributes *attri = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attri.frame = CGRectMake(x, y, width, height);
    
    return attri;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    for (int i = 0; i<self.colCount; i++) {
        NSString *col = [NSString stringWithFormat:@"%d",i];
        self.maxYdic[col] = @0;
    }
    
    NSMutableArray *arrray = [NSMutableArray array];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
    for (int i = 0; i < count; i++) {
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [arrray addObject:attrs];
    }
    
    return arrray;
}

@end
