//
//  SectionView.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/20.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "SectionView.h"

@implementation SectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)changeCV:(UIButton *)sender {
    [self.delegate changeCV:self andBtn:sender];
}



@end
