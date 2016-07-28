//
//  shopModel.h
//  CXWaterFull
//
//  Created by xiaoma on 16/7/28.
//  Copyright © 2016年 xiaoma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface shopModel : NSObject
/*!
 @property
 @brief 图片
 */
@property (nonatomic, copy) NSString *img;

/*!
 @property
 @brief 价格
 */
@property (nonatomic, copy) NSString *price;

/*!
 @property
 @brief 宽度
 */
@property (nonatomic, assign) CGFloat w;

/*!
 @property
 @brief 高度
 */
@property (nonatomic, assign) CGFloat h;



@end
