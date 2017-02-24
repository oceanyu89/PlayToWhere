//
//  detail_photo.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/23.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface detail_photo : NSObject

@property (nonatomic,assign) NSInteger size;

@property (nonatomic,assign) NSInteger uid;

@property (nonatomic,copy) NSString *format;

@property (nonatomic,assign) NSInteger height;

@property (nonatomic,copy) NSString *url;

@property (nonatomic,assign) NSInteger width;
@end
