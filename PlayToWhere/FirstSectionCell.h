//
//  FirstSectionCell.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/1/16.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FirstSectionCell;
@protocol FirstSectionCellDelegate <NSObject>
-(void)customPushToEatView:(FirstSectionCell *)FirstSectionCell;

@end

@interface FirstSectionCell : UITableViewCell
+(instancetype)FirstSectionCellForMain:(UITableView*)tableview;

@property (nonatomic,weak) id<FirstSectionCellDelegate> delegate;

@end
