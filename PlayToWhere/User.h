//
//  User.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/13.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic,assign) NSInteger id;
@property (nonatomic,copy) NSString *username;
@property (nonatomic,copy) NSString *headimg;
@property (nonatomic,assign) NSInteger sex;
@property (nonatomic,copy) NSString *signature;
@property (nonatomic,copy) NSString *location;
@end
