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
    self.layer.cornerRadius = self.height*0.5;
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderColor = [UIColor redColor].CGColor;
     self.layer.masksToBounds = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
