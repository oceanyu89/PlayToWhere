//
//  buttonAndImageView.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/10.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "buttonAndImageView.h"

@implementation buttonAndImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, self.bounds.size.width, 10)];
        titleLabel.text = @"测试字符字符";
        titleLabel.font = kFont(15);
        titleLabel.textColor = [UIColor whiteColor];
        [self addSubview:titleLabel];
        UILabel *noteLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, self.bounds.size.width*0.5, 10)];
         noteLabel.text = @"测试字符字符";
        noteLabel.font = kFont(15);
        noteLabel.textColor = [UIColor whiteColor];
        [self addSubview:noteLabel];
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
