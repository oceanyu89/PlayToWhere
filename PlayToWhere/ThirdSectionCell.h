//
//  ThirdSectionCell.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/7.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdSectionCell : UITableViewCell<UITableViewDataSource,UITableViewDelegate>

+(instancetype)ThirdSectionCellForMain:(UITableView*)tableview;

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
