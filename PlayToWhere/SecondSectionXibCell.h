//
//  SecondSectionXibCell.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/10.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondSectionXibCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIScrollView *secondSectionScrollView;

+(instancetype)SecondSectionCellForMain:(UITableView *)tableview;
@end
