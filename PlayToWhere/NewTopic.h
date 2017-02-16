//
//  NewTopic.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/15.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "BookMark.h"
#import "Comment.h"
#import "Group.h"
#import "Images.h"
@interface NewTopic : NSObject

@property (nonatomic,assign) NSInteger id;
@property(nonatomic,strong) User *user;
@property (nonatomic,copy) NSString *content;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,assign) NSInteger group_id;
@property (nonatomic,copy) NSString *ctime;
@property (nonatomic,copy) NSString *mtime;
@property (nonatomic,assign) NSInteger agree;
@property (nonatomic,assign) NSInteger disagree;
@property(nonatomic,strong)NSArray *images;
@property (nonatomic,assign) BOOL is_agreed;
@property (nonatomic,assign) BOOL is_disagreed;
@property (nonatomic,assign) BOOL is_bookmarked;
@property(nonatomic,strong)BookMark *bookmark;
@property(nonatomic,strong)Comment *comment;
@property(nonatomic,strong)Group *group;
@end
