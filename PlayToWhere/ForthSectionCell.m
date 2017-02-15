//
//  ForthSectionCell.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/13.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "ForthSectionCell.h"

@implementation ForthSectionCell

+(instancetype)ForthSectionCellForMain:(UITableView *)tableview
{
    
    ForthSectionCell *cell =[[NSBundle mainBundle] loadNibNamed:@"ForthSectionCell" owner:nil options:nil].firstObject;
    
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
