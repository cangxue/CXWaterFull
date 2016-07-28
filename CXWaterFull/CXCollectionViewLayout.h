//
//  CXCollectionViewLayout.h
//  CXWaterFull
//
//  Created by xiaoma on 16/7/27.
//  Copyright © 2016年 xiaoma. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CXCollectionViewLayout;
@protocol CXCollectionViewLayoutDelegate <NSObject>

- (CGFloat)CXWaterFlow:(CXCollectionViewLayout *)waterFlow heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath;

@end

@interface CXCollectionViewLayout : UICollectionViewLayout

@property (nonatomic, assign) id<CXCollectionViewLayoutDelegate>delegate;

/*!
 @property
 @brief 内边距
 */
@property (nonatomic, assign) UIEdgeInsets sectionInset;

/*!
 @property
 @brief 行间距
 */
@property (nonatomic, assign) CGFloat rowMagrin;

/*!
 @property
 @brief 列间距
 */
@property (nonatomic, assign) CGFloat colMagrin;

/*!
 @property
 @brief 多少列
 */
@property (nonatomic, assign) CGFloat colCount;


@end
