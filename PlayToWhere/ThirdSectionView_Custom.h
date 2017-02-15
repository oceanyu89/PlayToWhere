//
//  ThirdSectionView_Custom.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/10.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ThirdSectionView_Custom;
@protocol ThirdSectionView_CustomDelegate <NSObject>

-(void)clickMoreButton;
-(void)didSelectCellForRowIndex:(UITableView*)tableView andIndexPath:(NSIndexPath *)indexPath andTitle:(NSString *)title;
@end

@interface ThirdSectionView_Custom : UIView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak) id<ThirdSectionView_CustomDelegate> delegate;
@property(nonatomic,strong)NSArray *lists;
@end
