//
//  SecondSectionWithoutList.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/15.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "listSection.h"
@interface SecondSectionWithoutList : NSObject
@property (nonatomic,assign) NSInteger ret;
@property (nonatomic,copy) NSString *msg;
@property(nonatomic,strong)listSection *data;
@end
