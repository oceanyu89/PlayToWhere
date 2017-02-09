//
//  ForthSectionCell.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/7.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "ForthSectionCell.h"

@implementation ForthSectionCell

+(instancetype)ForthSectionCellForMain:(UITableView *)tableview
{
    ForthSectionCell *cell = [tableview dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell ==nil) {
        cell = [[ForthSectionCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"Cell"];
        cell.backgroundColor = [UIColor greenColor];
    }
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
