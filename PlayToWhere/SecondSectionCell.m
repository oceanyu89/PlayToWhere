//
//  SecondSectionCell.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/1/17.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "SecondSectionCell.h"

@implementation SecondSectionCell


+(instancetype)SecondSectionCellForMain:(UITableView *)tableview
{
    SecondSectionCell *cell = [tableview dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell ==nil) {
        cell = [[SecondSectionCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"Cell"];
        UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, tableview.frame.size.width, 140)];
        scroll.contentSize = CGSizeMake(tableview.frame.size.width*3-110, 140);
        scroll.backgroundColor = [UIColor greenColor];
        //tabbar_me  去哪拍美照
        UIImageView *image1 = [cell setImageAndLabel:@"tabbar_me" andLabel:@"去哪拍美照"andNumber:0];
        [scroll addSubview:image1];
        UIImageView *image2 = [cell setImageAndLabel:@"tabbar_me" andLabel:@"古镇"andNumber:1];
        [scroll addSubview:image2];
        UIImageView *image3 = [cell setImageAndLabel:@"tabbar_me" andLabel:@"购物"andNumber:2];
        [scroll addSubview:image3];
        UIImageView *image4 = [cell setImageAndLabel:@"tabbar_me" andLabel:@"海岛"andNumber:3];
        [scroll addSubview:image4];
        UIImageView *image5 = [cell setImageAndLabel:@"tabbar_me" andLabel:@"玩雪"andNumber:4];
        [scroll addSubview:image5];
        UIImageView *image6 = [cell setImageAndLabel:@"tabbar_me" andLabel:@"POSE大PK"andNumber:5];
        [scroll addSubview:image6];
        UIImageView *image7 = [cell setImageAndLabel:@"tabbar_me" andLabel:@"有声有色"andNumber:6];
        [scroll addSubview:image7];
        UIImageView *image8 = [cell setImageAndLabel:@"tabbar_me" andLabel:@"温泉"andNumber:7];
        [scroll addSubview:image8];
        UIImageView *image9 = [cell setImageAndLabel:@"tabbar_me" andLabel:@"深圳下午茶"andNumber:8];
        [scroll addSubview:image9];
        UIImageView *image10 = [cell setImageAndLabel:@"tabbar_me" andLabel:@"民宿"andNumber:9];
        [scroll addSubview:image10];
        [cell.contentView addSubview: scroll];

    }
    return cell;
}
-(UIImageView*)setImageAndLabel:(NSString *)imageName andLabel:(NSString *)labelName andNumber:(NSInteger)number
{
    UIImageView *image =[[UIImageView alloc]initWithFrame:CGRectMake(10 + number *110, 10, 100, 100)];
    image.image = [UIImage imageNamed:imageName];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, 100, 10)];
    label.text = labelName;
    label.textAlignment =NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    [image addSubview:label];
    return image;
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
