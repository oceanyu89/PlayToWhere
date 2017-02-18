//
//  Comment.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/15.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Comments.h"
@interface Comment : NSObject
@property (nonatomic,assign) NSInteger total;
@property(nonatomic,strong)NSArray *comments;

@end
