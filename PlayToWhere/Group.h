//
//  Group.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/15.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
@interface Group : NSObject
@property (nonatomic,assign) NSInteger id;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *icon_url;
@property(nonatomic,strong)User *user;
@end
