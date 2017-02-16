//
//  SecondSectionWithTopic.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/15.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataWithTopic.h"
@interface SecondSectionWithTopic : NSObject
@property (nonatomic,assign) NSInteger ret;
@property (nonatomic,copy) NSString *msg;
@property(nonatomic,strong)DataWithTopic *data;
@end
