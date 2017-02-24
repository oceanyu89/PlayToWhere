//
//  FirstVC.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/22.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "ZJPageViewController.h"
#import "ZJPageViewController.h"
#import "ZJScrollPageViewDelegate.h"
#import "detail_request.h"
@interface FirstVC : ZJPageViewController<ZJScrollPageViewChildVcDelegate>
@property(nonatomic,strong)detail_request *request_model;
@end
