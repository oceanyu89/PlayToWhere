//
//  detail_tags.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/23.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface detail_tags : NSObject

@property (nonatomic,copy) NSString* tag;

@property (nonatomic,assign) NSInteger count;

@property (nonatomic,assign) NSInteger voted;

@property (nonatomic,assign) NSInteger Boolean;
-(CGSize)tagWidth;

@end
