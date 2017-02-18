//
//  WebUtile.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/18.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ReCallData)(id obj);

@interface WebUtile : NSObject

+(void)requesHttpData:(NSString*)path andSome:(NSMutableDictionary *)parameters  andReCallData:(ReCallData)callBack;

@end
