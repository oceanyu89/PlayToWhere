//
//  Care_list.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/28.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Care_Haowans.h"
@interface Care_list : NSObject
@property(nonatomic,strong)User *user;
@property(nonatomic,strong)NSArray *haowans;
@property (nonatomic,copy) NSString* recommend_reason;

@end
