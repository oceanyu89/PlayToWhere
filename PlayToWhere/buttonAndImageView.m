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
        
    }
    return self;
}
-(void)createSomeView:(NSString *)imageName andTitle:(NSString *)title andNote:(NSString *)note
{
    self.userInteractionEnabled = YES;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = self.bounds;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSURL *url = [NSURL URLWithString:imageName];
        NSData *data = [NSData dataWithContentsOfURL:url];
        dispatch_async(dispatch_get_main_queue(), ^{
            [btn setBackgroundImage:[UIImage imageWithData:data]forState:(UIControlStateNormal)];
        });
    });

    [btn setTitle:title forState:UIControlStateNormal];
    btn.layer.cornerRadius = 12*SCREEN_WIDTH_RATIO;
    btn.clipsToBounds = YES;

    
    [self addSubview:btn];
    
    UILabel *noteLabel = [[UILabel alloc]init];
    noteLabel.centerX = btn.center.x-25;
    noteLabel.centerY = btn.center.y+10;
    noteLabel.width = btn.width*0.5;
    noteLabel.height = 20;
                          //WithFrame:CGRectMake(0, self.bounds.size.height-20, self.bounds.size.width*0.5, 20)];
    noteLabel.text = note;
    noteLabel.font = kFont(12);
    noteLabel.layer.cornerRadius = 6*SCREEN_WIDTH_RATIO;
    noteLabel.clipsToBounds = YES;
    [noteLabel setTextAlignment:(NSTextAlignmentCenter)];
    noteLabel.textColor = [UIColor whiteColor];
    noteLabel.backgroundColor = [UIColor redColor];
    [self addSubview:noteLabel];
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


@end
