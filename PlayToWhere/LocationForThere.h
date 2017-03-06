//
//  LocationForThere.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/3/1.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
typedef void (^LocationBlock)(NSString*location);
@interface LocationForThere : NSObject
@property(nonatomic,strong)LocationBlock locationBlock;

-(void)getNowLocation:(LocationBlock)locationBlock;

-(void)getLocationOfNowThere;
@end
