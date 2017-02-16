//
//  NightBoxLocation.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/16.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "NightBoxLocation.h"

@implementation NightBoxLocation

+(void)nightBoxLocationLayout:(UIImageView *)iv andSuperView:(UIView *)superView
{
    [iv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView).offset(20);
        make.left.equalTo(superView).offset(20);
        //             make.right.equalTo(_MyViewForAddImageView.mas_left).offset(-10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
        make.bottom.equalTo(superView).offset(-20);
        //             make.width.equalTo(self.myView2);
    }];

}

@end
