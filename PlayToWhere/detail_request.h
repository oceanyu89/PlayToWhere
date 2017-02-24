//
//  detail_request.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/23.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "detail_data.h"
@interface detail_request : NSObject
@property (nonatomic,assign) NSInteger ret;
@property (nonatomic,copy) NSString *msg;
@property(nonatomic,strong)detail_data *data;

@end
