//
//  HomeHereCell.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/3/3.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "HomeHereCell.h"

@implementation HomeHereCell
-(void)setHomeString:(NSString *)homeString
{
    _homeString = homeString;
    self.homeHere.text = homeString;
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
