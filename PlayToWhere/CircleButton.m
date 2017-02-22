//
//  CircleButton.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/21.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "CircleButton.h"

@implementation CircleButton
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.layer.cornerRadius = self.width*0.5;
    self.clipsToBounds = YES;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
