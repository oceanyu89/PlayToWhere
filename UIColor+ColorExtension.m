//
//  UIColor+ColorExtension.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/1/17.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "UIColor+ColorExtension.h"

@implementation UIColor (ColorExtension)
+(UIColor*)colorWith255Red:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(NSUInteger)alpha {
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha/255.0];
}

//0x   f    f    A    2    f    f    0    8
//     1111 1111 1011 0010 1111 1111 0000 1000
//     0000 0000 0000 0000 0000 0000 1111 1111
//-----------------------------------------------

+(UIColor*)colorWithHex:(NSUInteger)hex {
    NSUInteger alpha = (hex & 0xFF000000)>>24;
    NSUInteger red = (hex & 0xFF0000)>>16;
    NSUInteger green = (hex & 0xFF00)>>8;
    NSUInteger blue = hex & 0xFF;
    return  [UIColor colorWith255Red:red green:green blue:blue alpha:alpha];
}
@end
