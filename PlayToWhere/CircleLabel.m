//
//  CircleLabel.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/21.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "CircleLabel.h"

@implementation CircleLabel
-(void)layoutSubviews
{
    self.layer.cornerRadius = 6*SCREEN_WIDTH_RATIO;
    self.textAlignment = NSTextAlignmentCenter;
    self.font = kFont(8);
    self.backgroundColor = [UIColor grayColor];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
