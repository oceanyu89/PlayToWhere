//
//  CustomButton_leftTitleRightImage.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/8.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "CustomButton_leftTitleRightImage.h"

@implementation CustomButton_leftTitleRightImage

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGRect titleF = self.titleLabel.frame;
    CGRect imageF = self.imageView.frame;
    titleF.origin.x = 0+5;
    self.titleLabel.frame = titleF;
    imageF.origin.x = CGRectGetMaxX(titleF)+5;
    self.imageView.frame = imageF;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
