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
}
- (IBAction)sleepBtnClicked:(UIButton *)sender {
}

+(instancetype)FirstSectionCellForMain:(UITableView *)tableview
{
    FirstSectionCell *cell = [tableview dequeueReusableCellWithIdentifier:@"myCell"];
    if (cell == nil) {
        //创建自定义cell  (通过xib创建)
        //在当前应用程序文件夹下 找到 NewsListCell.xib ，并创建xib中所有的视图对象，存放到数组中，最终返回一个数组
        //通过xib创建cell  Identifier 需要在 xib 中设置
        cell = [[NSBundle mainBundle] loadNibNamed:@"FirstSectionCell" owner:nil options:nil].firstObject;
        
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
