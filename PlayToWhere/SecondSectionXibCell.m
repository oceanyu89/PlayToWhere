//
//  SecondSectionXibCell.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/10.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "SecondSectionXibCell.h"

@implementation SecondSectionXibCell


+(instancetype)SecondSectionCellForMain:(UITableView *)tableview
{

    SecondSectionXibCell *cell =[[NSBundle mainBundle] loadNibNamed:@"SecondSectionXibCell" owner:nil options:nil].firstObject;

    return cell;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
