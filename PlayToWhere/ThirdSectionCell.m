//
//  ThirdSectionCell.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/7.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "ThirdSectionCell.h"

@implementation ThirdSectionCell

+(instancetype)ThirdSectionCellForMain:(UITableView *)tableview
{
    ThirdSectionCell *cell = [tableview dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell ==nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"ThirdSectionCell" owner:nil options:nil].firstObject;
//        cell.backgroundColor = [UIColor redColor];
    }
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell ==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    }
    cell.backgroundColor = [UIColor orangeColor];
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
