//
//  Model_2L.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/20.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "list_model.h"
@interface Model_2L : NSObject
@property (nonatomic,assign) NSInteger ret;
@property (nonatomic,copy) NSString *msg;
@property(nonatomic,strong)list_model *data;
@end
