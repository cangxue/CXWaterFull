//
//  ViewController.m
//  CXWaterFull
//
//  Created by xiaoma on 16/7/27.
//  Copyright © 2016年 xiaoma. All rights reserved.
//

#import "ViewController.h"
#import "CXCollectionViewLayout.h"
#import "shopModel.h"
#import "CXCollectionViewCell.h"
#import "MJExtension.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,CXCollectionViewLayoutDelegate>

@property (nonatomic, assign) shopModel *shop;

@property (nonatomic, assign) UICollectionView *collectView;

@property (nonatomic, strong) NSMutableArray *shops;

@end

@implementation ViewController

- (NSMutableArray *)shops {
    if (_shops == nil) {
        self.shops = [NSMutableArray array];
    }
    return _shops;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray * shopsArray = [shopModel objectArrayWithFilename:@"plistdemo.plist"];
    [self.shops addObjectsFromArray:shopsArray];
//    
//    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"plistdemo" ofType:@"plist"];
//    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
//    
//    for (NSDictionary *dic in data) {
//        shopModel *model = [[shopModel alloc] init];
//        model.img = dic[@"img"];
//        model.price = dic[@"price"];
//        model.w = [dic[@"w"] floatValue];
//        model.h = [dic[@"h"] floatValue];
//        
//        [self.shops addObject:model];
//    }
    
    //注册cell
    CXCollectionViewLayout *layout = [[CXCollectionViewLayout alloc] init];
    layout.delegate = self;
    UICollectionView *collectView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    collectView.delegate = self;
    collectView.dataSource = self;
    [self.view addSubview:collectView];
    [collectView registerNib:[UINib nibWithNibName:@"CXCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CXCollectionViewCell"];
    self.collectView = collectView;
}

#pragma mark - UICollectionView DataSource/Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.shops.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath; {
    CXCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CXCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    cell.shop = self.shops[indexPath.item];
    return cell;
}

- (CGFloat)CXWaterFlow:(CXCollectionViewLayout *)waterFlow heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath {
    shopModel *shop = self.shops[indexPath.item];
    return shop.h/shop.w * width;
}
@end
