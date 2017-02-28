//
//  TalkersCell.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/27.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "detail_list.h"
@interface TalkersCell : UITableViewCell

@property(nonatomic,strong)detail_vote *vote;
+(TalkersCell*)getCustomCellAtTalker;

@end
