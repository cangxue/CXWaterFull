//
//  CXCollectionViewCell.m
//  CXWaterFull
//
//  Created by xiaoma on 16/7/28.
//  Copyright © 2016年 xiaoma. All rights reserved.
//

#import "CXCollectionViewCell.h"

@implementation CXCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setShop:(shopModel *)shop
{
    _shop = shop;
    self.priceLabel.text = _shop.price;
}

@end
