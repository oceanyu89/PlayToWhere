//
//  IndexCollectionView.h
//  BigImageShow
//
//  Created by liuyan on 16/8/10.
//  Copyright © 2016年 liuyan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^IndexScrollBlock)(NSIndexPath *indexPath);

@interface BigImageIndexCollectionView : UICollectionView

@property(nonatomic, strong) NSArray *movieModelArray;
@property (nonatomic, assign)NSInteger currentPage;
@property (nonatomic, assign)NSInteger itemWidth;
@property (nonatomic, assign)CGFloat minLineSpacing;

@property(nonatomic,copy)IndexScrollBlock didScrollBlcok;

- (void)collectionViewDidScrollWithScrollBlock:(IndexScrollBlock)didScrollBlcok;


@end
