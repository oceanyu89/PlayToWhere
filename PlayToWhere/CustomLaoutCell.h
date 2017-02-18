//
//  CustomLaoutCell.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/15.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewTopic.h"
@interface CustomLaoutCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userDate;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
+(instancetype)getCustomLayoutCell:(UITableView*)tableView andIndexPath:(NSIndexPath *)indexPath;
@property(nonatomic,strong)NewTopic *topic;
@property (weak, nonatomic) IBOutlet UIView *MyViewForAddImageView;



@end
