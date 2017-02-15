//
//  list_model.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/13.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "SonSection_model.h"
#import "Haowan.h"
#import "Watch.h"
#import "Topic.h"
@interface list_model : NSObject

@property (nonatomic,assign) NSInteger id;
@property(nonatomic,strong) User *user;
@property (nonatomic,copy) NSString *location;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *content;
@property (nonatomic,copy) NSString *ctime;
@property (nonatomic,copy) NSString *mtime;
@property(nonatomic) BOOL is_watched;
@property (nonatomic,assign) NSInteger new_topics;
@property(nonatomic,strong)NSArray *related_collections;
@property(nonatomic,strong)NSArray *sections;
@property(nonatomic,strong)Haowan *haowan;
@property(nonatomic,strong)Watch *watch;
@property(nonatomic,strong)Topic *topic;
@property(nonatomic,strong)NSArray *buildin_tags;
@property (nonatomic,assign) NSInteger buildin_group_id;
@property (nonatomic,copy) NSString *icon_url;
@property (nonatomic,copy) NSString *cover_url;
@property (nonatomic,assign) NSInteger type;

@end
