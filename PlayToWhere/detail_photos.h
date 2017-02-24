//
//  detail_photos.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/23.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "detail_photo.h"
@interface detail_photos : NSObject
//image	Object
@property(nonatomic,strong)detail_photo* image;
@property (nonatomic,copy) NSArray *tags;

@property (nonatomic,assign) NSInteger tags_coord_width;

@property (nonatomic,assign) NSInteger tags_coord_height;

@end
