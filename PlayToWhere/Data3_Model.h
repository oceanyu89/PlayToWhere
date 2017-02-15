//
//  Data3_Model.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/13.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "image_Model.h"
@interface Data3_Model : NSObject
@property(nonatomic,strong)image_Model *image;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *url;

@end
