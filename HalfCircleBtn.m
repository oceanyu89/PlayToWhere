//
//  HalfCircleBtn.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/24.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "HalfCircleBtn.h"

@implementation HalfCircleBtn

-(void)layoutSubviews
{
     [super layoutSubviews];
    self.layer.cornerRadius = self.height*0.5;
//    self.backgroundColor = [UIColor greenColor];
    self.layer.borderColor = [UIColor redColor].CGColor;
    [self.layer setBorderWidth:1];
     self.layer.masksToBounds = YES;
    self.titleLabel.font = kFont(10);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
