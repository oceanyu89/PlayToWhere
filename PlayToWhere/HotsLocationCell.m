//
//  HotsLocationCell.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/3/3.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "HotsLocationCell.h"

@implementation HotsLocationCell

+(instancetype)createHotsLocationCell:(UITableView *)tableView andData:(DataModel_address*)dataModel
{
    HotsLocationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hotsCell"];
    if (cell==nil) {
        cell = [HotsLocationCell new];
    }
    for (int i=0; i<dataModel.hots.count; i++) {
        CGFloat w = (SCREEN_WIDTH-32)/3;
        CGFloat h = 30;
        HotsModel_address *hot = dataModel.hots[i];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame =CGRectMake(8+i%3*(w+8),20+ i/3*(h+7), w, h);
        [btn setTitle:hot.name forState:UIControlStateNormal];
        [btn.titleLabel setFont: kFont(12)];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        btn.backgroundColor = randomColor;
        [cell.contentView addSubview:btn];
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
