//
//  CollectionViewForCell.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/28.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"
//#import "Care_Haowans.h"
typedef NSInteger (^NumberItemsBlock)(NSInteger section);
typedef void(^CellForItemAtIndexBlock)(CollectionViewCell *cell,NSIndexPath *indexPath);

@interface CollectionViewForCell : UICollectionView
//@property(nonatomic,strong)Care_Haowans *haoWans;

@property (nonatomic,strong) NumberItemsBlock numberOfItemsBlock;
@property(nonatomic,strong)CellForItemAtIndexBlock cellForItemAtIndexBlock;

-(void)gainNumberOfItemsBlock:(NumberItemsBlock)numberOfItemsBlock;

-(void)gainCellForItemAtIndexBlock:(CellForItemAtIndexBlock)cellForItemAtIndexBlock;

@end
