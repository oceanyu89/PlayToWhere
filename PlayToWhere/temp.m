//
//  temp.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/18.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "temp.h"

@implementation temp


//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        //耗时操作
//        //section1 数据请求
//        NSString *stringURL = @"http://nahaowan.com/api/v1/collection/list?list=explore&location=%E6%B7%B1%E5%9C%B3&offset=0";
//        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//        [WebUtile requesHttpData:stringURL andSome:dic andReCallData:^(id obj) {
//            self.model1  = [SectionTwoToInteresting yy_modelWithJSON:obj];
//            [SVProgressHUD dismiss];
//            [self.tableView reloadData];
//            [self.tableView.mj_header endRefreshing];
//        }];
//
//    });
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        //耗时操作
//        //section2 数据请求
//        NSString *stringURL =@"http://nahaowan.com/api/v1/group/list?list=hot&location=%E6%B7%B1%E5%9C%B3";
//         NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//        [WebUtile requesHttpData:stringURL andSome:dic andReCallData:^(id obj) {
//            self.model2 = [SectionTwoToInteresting yy_modelWithJSON:obj];
//            [SVProgressHUD dismiss];
//            [self.tableView reloadData];
//            [self.tableView.mj_header endRefreshing];
//        }];
//    });
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        //section3 数据请求
//        NSString *stringURL =@"http://nahaowan.com/api/v2/haowan/list/ad?geo=22.6481848889781%2C114.210079510808&location=%E6%B7%B1%E5%9C%B3";
//        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//        [WebUtile requesHttpData:stringURL andSome:dic andReCallData:^(id obj) {
//            self.model3 =[LastSection_model yy_modelWithJSON:obj];
//            [SVProgressHUD dismiss];
//            [self.tableView reloadData];
//            [self.tableView.mj_header endRefreshing];
//        }];
//    });

//***********************************************************************************

//dispatch_group_t group = dispatch_group_create();//创建一个线程组
////开一个基于group这个组的并行线程 ：线程一
//dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
//    NSString *stringURL = @"http://nahaowan.com/api/v1/collection/list?list=explore&location=%E6%B7%B1%E5%9C%B3&offset=0";
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    [WebUtile requesHttpData:stringURL andSome:dic andReCallData:^(id obj) {
//        self.model1  = [SectionTwoToInteresting yy_modelWithJSON:obj];
//    }];
//    
//});
//dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
//    NSString *stringURL =@"http://nahaowan.com/api/v1/group/list?list=hot&location=%E6%B7%B1%E5%9C%B3";
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    [WebUtile requesHttpData:stringURL andSome:dic andReCallData:^(id obj) {
//        self.model2 = [SectionTwoToInteresting yy_modelWithJSON:obj];
//    }];
//    
//});
//dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
//    NSString *stringURL =@"http://nahaowan.com/api/v2/haowan/list/ad?geo=22.6481848889781%2C114.210079510808&location=%E6%B7%B1%E5%9C%B3";
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    [WebUtile requesHttpData:stringURL andSome:dic andReCallData:^(id obj) {
//        self.model3 =[LastSection_model yy_modelWithJSON:obj];
//    }];
//    
//});
//dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
//    
//    [SVProgressHUD dismiss];
//    [self.tableView reloadData];
//    [self.tableView.mj_header endRefreshing];
//});
@end
