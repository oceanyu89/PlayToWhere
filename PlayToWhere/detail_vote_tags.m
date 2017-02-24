//
//  detail_vote_tags.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/23.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "detail_vote_tags.h"

@implementation detail_vote_tags
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"tags" : [detail_tags class]};
}

@end
