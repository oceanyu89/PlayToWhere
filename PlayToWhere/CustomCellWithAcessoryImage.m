//
//  CustomCellWithAcessoryImage.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/10.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "CustomCellWithAcessoryImage.h"

@implementation CustomCellWithAcessoryImage

+(CustomCellWithAcessoryImage *)initWithCustomWithAccessoryView:(NSString *)imageName andTitle:(NSString *)title andDetail:(NSString *)detail andAccessoryImageName:(NSString *)accessoryImageName
{
    CustomCellWithAcessoryImage *cell = [[CustomCellWithAcessoryImage alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];

    cell.textLabel.text = title;
    cell.textLabel.font = kFont(15);
    cell.detailTextLabel.text = detail;
    cell.detailTextLabel.textColor = [UIColor grayColor];
    cell.textLabel.font = kFont(12);
    UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];

    [cell.imageView setImageWithURL:[NSURL URLWithString:imageName] placeholderImage:[UIImage imageNamed:@"default_user_head"]];
    if ([accessoryImageName containsString:@"http"]) {
            [iv setImageWithURL:[NSURL URLWithString:accessoryImageName] placeholderImage:[UIImage imageNamed:@"default_user_head"]];
    }
    else
    {
        iv.image = [UIImage imageNamed:accessoryImageName];
    }
    iv.backgroundColor=[UIColor orangeColor];
    iv.layer.cornerRadius = iv.bounds.size.width*0.5;
    iv.clipsToBounds = YES;
    cell.accessoryView = iv;
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
