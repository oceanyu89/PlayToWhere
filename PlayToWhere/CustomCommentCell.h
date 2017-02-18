//
//  CustomCommentCell.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/16.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewTopic.h"
@interface CustomCommentCell : UITableViewCell
+(instancetype)getCustomLayoutCell:(UITableView*)tableView andIndexPath:(NSIndexPath *)indexPath;

@property(nonatomic,strong)Comment *comment;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end
