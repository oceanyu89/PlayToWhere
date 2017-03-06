//
//  CareRequest_Model.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/28.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Care_Data.h"
@interface CareRequest_Model : NSObject
@property (nonatomic,assign) NSInteger ret;
@property (nonatomic,copy) NSString *msg;
@property(nonatomic,strong)Care_Data *data;

@end
