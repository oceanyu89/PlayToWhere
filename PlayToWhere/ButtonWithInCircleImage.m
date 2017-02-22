//
//  ButtonWithInCircleImage.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/21.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "ButtonWithInCircleImage.h"

@implementation ButtonWithInCircleImage
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.layer.cornerRadius = 6*SCREEN_WIDTH_RATIO;
    self.imageView.layer.cornerRadius = 12*SCREEN_WIDTH_RATIO;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
