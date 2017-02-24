//
//  FirstCellForAllSecondSection.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/21.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "detail_list.h"
@interface FirstCellForAllSecondSection : UITableViewCell
//@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
//@property (weak, nonatomic) IBOutlet UILabel *userDate;
//@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UIButton *addressName;
@property(nonatomic,strong)detail_list *list;
@end
