//
//  FirstCell.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/15.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "FirstCell.h"

@implementation FirstCell

+(instancetype)getFirstCell:(UITableView *)tableview andImageName:(NSString *)imageName andTitle:(NSString *)title
{
    FirstCell *cell = [tableview dequeueReusableCellWithIdentifier:@"cell"];
        if (cell==nil) {
            cell = [[FirstCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        }
        NSURL  *url = [NSURL URLWithString:imageName];
        NSData *data = [NSData dataWithContentsOfURL:url];
        cell.imageView.image = [UIImage imageWithData:data];
        cell.imageView.layer.cornerRadius = 16;
        cell.imageView.layer.masksToBounds=YES;
        cell.textLabel.text =title;
        cell.textLabel.font = kFont(12);
        cell.textLabel.textColor = [UIColor orangeColor];
        cell.detailTextLabel.text = @"主持人";
        cell.detailTextLabel.textColor = [UIColor whiteColor];
        cell.detailTextLabel.backgroundColor = [UIColor orangeColor];
        cell.detailTextLabel.font = kFont(12);
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

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
