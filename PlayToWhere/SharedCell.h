//
//  SharedCell.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/27.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleButton.h"
#import "detail_list.h"
@interface SharedCell : UICollectionViewCell

@property(nonatomic,strong)detail_list *list;
@end
