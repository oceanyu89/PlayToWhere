//
//  CareBtn.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/28.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "CareBtn.h"

@implementation CareBtn
-(void)layoutSubviews
{
    [super layoutSubviews];
    [self setImage:[UIImage imageNamed:@"add-question_14x14_"] forState:UIControlStateNormal];
    [self setTitle:@"关注" forState:UIControlStateNormal];
    [self setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
