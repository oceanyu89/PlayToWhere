//
//  HalfCirleBtnWithCirleLabel.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/24.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "HalfCirleBtnWithCirleLabel.h"

@implementation HalfCirleBtnWithCirleLabel


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.btn = [CustomButton_leftTitleRightImage buttonWithType:UIButtonTypeCustom];
        self.btn.frame = self.bounds;
        self.btn.layer.cornerRadius = self.btn.height*0.5;
        self.btn.titleLabel.font = kFont(8);
        self.btn.layer.masksToBounds = YES;
        self.btn.backgroundColor = [UIColor colorWith255Red:180 green:199 blue:206 alpha:255];
        [self addSubview:self.btn];
        self.label = [[CircleLabel alloc]initWithFrame:CGRectMake(self.width-30, 2, 26, 26)];
        self.label.textColor = [UIColor grayColor];
        [self addSubview:self.label];
        self.layer.cornerRadius = 6*SCREEN_WIDTH_RATIO;
        self.layer.masksToBounds = YES;
        //对按钮传入的参数+1，将label传送过去，以方便可以点击按钮后，label值会同时改变
        objc_setAssociatedObject(self.btn, "firstObject", self.label, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
