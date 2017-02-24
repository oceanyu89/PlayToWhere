//
//  detail_data.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/23.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "detail_list.h"
@interface detail_data : NSObject
@property (nonatomic,assign) NSInteger total;
@property (nonatomic,assign) NSInteger id_gt;
@property (nonatomic,assign) NSInteger id_lt;
@property (nonatomic,assign) NSInteger pos;
@property (nonatomic,copy) NSArray *list;
@end
