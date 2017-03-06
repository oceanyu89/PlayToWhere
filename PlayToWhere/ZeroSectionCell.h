//
//  ZeroSectionCell.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/28.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Care_list.h"
@interface ZeroSectionCell : UITableViewCell
@property(nonatomic,strong)Care_list *list;

+(instancetype)createZeroSectionCell:(UITableView *)tableView;
@end
