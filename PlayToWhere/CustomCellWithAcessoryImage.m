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

    NSURL *url = [NSURL URLWithString:imageName];
    NSData *data = [NSData dataWithContentsOfURL:url];
    cell.imageView.image = [UIImage imageWithData:data];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSURL *url2 = [NSURL URLWithString:accessoryImageName];
        NSData *data2 = [NSData dataWithContentsOfURL:url2];
        dispatch_async(dispatch_get_main_queue(), ^{
            iv.image = [UIImage imageWithData:data2];
        });
    });
    
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
