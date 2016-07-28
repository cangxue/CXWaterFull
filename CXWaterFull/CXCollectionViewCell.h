//
//  CXCollectionViewCell.h
//  CXWaterFull
//
//  Created by xiaoma on 16/7/28.
//  Copyright © 2016年 xiaoma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "shopModel.h"

@interface CXCollectionViewCell : UICollectionViewCell

@property (nonatomic, assign) shopModel *shop;

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end
