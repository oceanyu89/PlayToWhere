//
//  detail_photo.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/23.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "detail_photo.h"

@implementation detail_photo
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"uid" : @"id"};
}


-(float)photoHeight
{
    CGFloat photoWidth = (SCREEN_WIDTH-24)*0.5;
    CGFloat photoHeight = self.height/(self.width/photoWidth);
    return photoHeight;
}
@end
