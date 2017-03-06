//
//  Care_Data.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/28.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Care_list.h"
@interface Care_Data : NSObject
@property (nonatomic,assign) NSInteger total;
@property (nonatomic,assign) NSInteger pos;
@property(nonatomic,strong)NSArray *list;
@end
