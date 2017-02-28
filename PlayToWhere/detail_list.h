//
//  detail_list.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/23.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "detail_photos.h"
#import "detail_user.h"
#import "Comment.h"
#import "detail_vote_tags.h"
@class detail_vote;


@interface detail_list : NSObject
@property(nonatomic,assign) NSInteger uid;
@property(nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSArray *photos;

@property (nonatomic,copy) NSString *location;
@property (nonatomic,copy) NSString *address;
//geo	Object 用不到
@property (nonatomic,copy) NSString *geo_type;
@property (nonatomic,assign) NSInteger distance;
@property (nonatomic,strong) NSDate *ctime;
//user	Object
@property(nonatomic,strong)detail_user *user;
@property (nonatomic,assign) BOOL is_voted;
@property (nonatomic,assign) BOOL is_togo;
@property (nonatomic,assign) BOOL is_been;
//vote	Object
@property(nonatomic,strong)detail_vote *vote;
//comment	Object
@property(nonatomic,strong)Comment *comment;
//togo	Object
//been	Object
//vote_tags	Object
@property(nonatomic,strong)detail_vote_tags *vote_tags;
//watched_collections	Object
@property (nonatomic,copy) NSString *location_country;
@property (nonatomic,copy) NSString *location_province;
@property (nonatomic,copy) NSString *location_city;
@property(nonatomic,assign) NSInteger poi_id;



-(float)textHeight;
-(float)buttonHeight;
//-(float)buttonWidth;
-(float)talkAboutHeight;



@end


@interface detail_vote :NSObject

@property (nonatomic,assign) NSInteger total;
@property (nonatomic,copy) NSArray* users;

@end




