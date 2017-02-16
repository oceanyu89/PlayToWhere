//
//  DataWithTopic.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/15.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewTopic.h"
@interface DataWithTopic : NSObject
@property (nonatomic,assign) NSInteger total;
@property (nonatomic,assign) NSInteger pos;
@property(nonatomic,strong)NSArray *topics;
@end
