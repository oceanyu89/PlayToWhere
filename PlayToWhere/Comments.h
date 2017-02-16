//
//  Comments.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/15.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comments : NSObject
@property (nonatomic,assign) NSInteger id;
@property(nonatomic,strong)User *user;
@property (nonatomic,copy) NSString *content;
@property (nonatomic,assign) NSInteger topic_id;
@property (nonatomic,assign) NSInteger group_id;
@property (nonatomic,copy) NSString *ctime;
@end
