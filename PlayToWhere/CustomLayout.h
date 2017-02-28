//
//  CustomLayout.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/27.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UICollectionViewLayout;

@protocol CustomLayoutDelegate <NSObject>

@required
//决定cell的高度,必须实现方法
- (CGFloat)waterFlowLayout:(UICollectionViewLayout *)waterFlowLayout heightForRowAtIndex:(NSInteger)index itemWidth:(CGFloat)width;

@optional
//决定cell的列数
- (NSInteger)cloumnCountInWaterFlowLayout:(UICollectionViewLayout *)waterFlowLayout;

//决定cell 的列的距离
- (CGFloat)columMarginInWaterFlowLayout:(UICollectionViewLayout *)waterFlowLayout;

//决定cell 的行的距离
- (CGFloat)rowMarginInWaterFlowLayout:(UICollectionViewLayout *)waterFlowLayout;

//决定cell 的边缘距
- (UIEdgeInsets)edgeInsetInWaterFlowLayout:(UICollectionViewLayout *)waterFlowLayout;

@end

@interface CustomLayout : UICollectionViewLayout

/**代理*/
@property (nonatomic,assign) id <CustomLayoutDelegate>delegate;

- (NSInteger)columCount;
- (CGFloat)columMargin;
- (CGFloat)rowMargin;
- (UIEdgeInsets)defaultEdgeInsets;

@end
