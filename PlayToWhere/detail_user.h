//
//  detail_user.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/23.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface detail_user : NSObject

@property (nonatomic,assign) NSInteger uid;

@property (nonatomic,copy) NSString* username;

@property (nonatomic,copy) NSString* headimg;

@property (nonatomic,assign) NSInteger sex;

@property (nonatomic,copy) NSString* signature;

@property (nonatomic,copy) NSString* location;

@property (nonatomic,assign) NSInteger is_followed;
@end
