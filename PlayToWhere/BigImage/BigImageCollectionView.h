//
//  BigImageCollectionView.h
//  BigImageShow
//
//  Created by liuyan on 16/8/10.
//  Copyright © 2016年 liuyan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DidScrollBlock)(UICollectionView *scrollView);

@interface BigImageCollectionView : UICollectionView

@property(nonatomic, strong) NSArray *movieModelArray;
@property (nonatomic, assign)NSInteger currentPage;
@property (nonatomic, assign)NSInteger itemWidth;
@property (nonatomic, assign)CGFloat minLineSpacing;

@property(nonatomic,copy)DidScrollBlock didScrollBlcok;


- (void)collectionViewDidScrollWithScrollBlock:(DidScrollBlock)didScrollBlcok;


@end
