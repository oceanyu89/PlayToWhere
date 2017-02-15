//
//  ForthSectionCell.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/13.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForthSectionCell : UITableViewCell

@property (nonatomic,copy) NSString  *imageName;
+(instancetype)ForthSectionCellForMain:(UITableView *)tableview;
@property (weak, nonatomic) IBOutlet UIButton *showButton;

@end
