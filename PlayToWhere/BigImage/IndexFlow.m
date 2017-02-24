//
//  IndexFlow.m
//  BigImageShow
//
//  Created by liuyan on 16/8/11.
//  Copyright © 2016年 liuyan. All rights reserved.
//

#import "IndexFlow.h"


#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenheight [UIScreen mainScreen].bounds.size.height

#define ItemWide      80
#define ItemHeight    80



#define ACTIVE_DISTANCE 21
#define ZOOM_FACTOR 0.5


@implementation IndexFlow

- (id)init
{
    self = [super init];
    if (self) {
        self.itemSize = CGSizeMake(ItemWide, ItemHeight);
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.sectionInset = UIEdgeInsetsMake(8,8,8,8);
        self.minimumLineSpacing = 8;
        self.minimumInteritemSpacing = 8;
    }

    return self;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds
{
    return YES;
}
//modigy by yuhy 不需要transform3D动画
//-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
//{
//    // 取出所有元素
//    NSArray *array = [super layoutAttributesForElementsInRect:rect];
//    // 可视区域
//    CGRect visibleRect;
//    visibleRect.origin = self.collectionView.contentOffset;
//    visibleRect.size = self.collectionView.bounds.size;    
//    for (UICollectionViewLayoutAttributes *attribute in array) {
//        CGFloat distance = CGRectGetMidX(visibleRect) - attribute.center.x;
//        CGFloat normalizedDistance = distance / ACTIVE_DISTANCE;
//        if (ABS(distance) < ACTIVE_DISTANCE) {
//            CGFloat zoom = 1 + ZOOM_FACTOR*(1 - ABS(normalizedDistance));
//            attribute.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0);
//            attribute.zIndex = 1;
//            
//        }
//    }
//    return array;
//}

/**
 *  设置collectionView停止滚动那一刻的位置
 *
 *  @param proposedContentOffset 原本collectionView停止滚动那一刻的位置
 *  @param velocity              速度
 *
 *  @return 最终的位置
 */
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGFloat offsetAdjustment = MAXFLOAT;
    CGFloat horizontalCenter = proposedContentOffset.x + (CGRectGetWidth(self.collectionView.bounds) / 2.0);
    // 停止时刻的可视区域
    CGRect targetRect = CGRectMake(proposedContentOffset.x, 0.0, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    NSArray* array = [super layoutAttributesForElementsInRect:targetRect];
    for (UICollectionViewLayoutAttributes* layoutAttributes in array) {
        CGFloat itemHorizontalCenter = layoutAttributes.center.x;
        if (ABS(itemHorizontalCenter - horizontalCenter) < ABS(offsetAdjustment)) {
            offsetAdjustment = itemHorizontalCenter - horizontalCenter;
        }
    }
    return CGPointMake(proposedContentOffset.x + offsetAdjustment, proposedContentOffset.y);
}


@end
