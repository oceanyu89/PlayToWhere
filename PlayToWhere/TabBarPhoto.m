//
//  TabBarPhoto.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/6.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "TabBarPhoto.h"

@implementation TabBarPhoto
- (instancetype)init
{
    self = [super init];
    if (self) {
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [btn setImage:[UIImage imageNamed:@"tabbar-publish_40x40_"] forState:(UIControlStateNormal)];
        btn.bounds = CGRectMake(0, 0, 44, 44);
        self.centerBtn = btn;
        [self addSubview:btn];
    }
    return self;
}
//自动布局
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.centerBtn.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    int index = 0;
    CGFloat wigth = self.bounds.size.width / 5;    //算出每个按钮的平均宽度
    //通过遍历tabbar的子视图，重新布局tabbar上的按钮
    for (UIView* sub in self.subviews) {
        if ([sub isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            sub.frame = CGRectMake(index * wigth, self.bounds.origin.y, wigth, self.bounds.size.height );
            index++;
            //index == 2 表示是中间的button ，不做任何操作，空出来
            if (index == 2) {
                index++;
            }
        }
    }

    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
