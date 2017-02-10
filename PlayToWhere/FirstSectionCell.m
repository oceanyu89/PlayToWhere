//
//  FirstSectionCell.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/1/16.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "FirstSectionCell.h"

@interface FirstSectionCell()

@end

@implementation FirstSectionCell

- (IBAction)eatBtnClicked:(UIButton *)sender {
    [self.delegate customPushToEatView:self];
    
}
- (IBAction)playBtnClicked:(UIButton *)sender {
     [self.delegate customPushToEatView:self];
}
- (IBAction)sleepBtnClicked:(UIButton *)sender {
     [self.delegate customPushToEatView:self];
}

+(instancetype)FirstSectionCellForMain:(UITableView *)tableview
{

    FirstSectionCell *cell =[[NSBundle mainBundle] loadNibNamed:@"FirstSectionCell" owner:nil options:nil].firstObject;
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
