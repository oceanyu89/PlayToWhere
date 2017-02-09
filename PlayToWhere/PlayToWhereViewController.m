//
//  PlayToWhereViewController.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/1/17.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "PlayToWhereViewController.h"
#import "MainTableViewController.h"
#import "ConcernTableViewController.h"
#import "DestinationCollectionViewController.h"
#import "MeTableViewController.h"
#import "TabBarPhoto.h"

@interface PlayToWhereViewController ()

@end

@implementation PlayToWhereViewController
+(void)initialize // 自动调用
{
    UITabBar *bar = [UITabBar appearance]; // 获取系统的tabbar
    [bar setBackgroundColor:[UIColor whiteColor]];
    [bar setBackgroundImage:[UIImage imageNamed:@"alpha"]];
//    [bar setSelectionIndicatorImage:[UIImage imageNamed:@"alpha"]];
    //设置item中文字的默认样式
    UITabBarItem *item = [UITabBarItem appearance];//取到系统样式外观
    
    NSMutableDictionary *dicNormal = [NSMutableDictionary dictionary];
    dicNormal[NSForegroundColorAttributeName]=[UIColor colorWith255Red:100 green:100 blue:100 alpha:255];
    [item setTitleTextAttributes:dicNormal forState:(UIControlStateNormal)];
    //设置选中颜色
    NSMutableDictionary *dicSelect = [NSMutableDictionary dictionary];
    dicSelect[NSForegroundColorAttributeName]=[UIColor colorWith255Red:251 green:65 blue:66 alpha:255];
    [item setTitleTextAttributes:dicSelect forState:(UIControlStateSelected)];
    
}
+(UITabBarController*)createTabBarView
{
    UITabBarController *tab = [[UITabBarController alloc]init];
    // 哪好玩
    MainTableViewController*mainVC =  [[MainTableViewController alloc]initWithNibName:@"MainTableViewController" bundle:nil];
        FirstSectionNavigationController *navi1 =[[FirstSectionNavigationController alloc]initWithRootViewController:mainVC];
    mainVC.navigationItem.title = @"";
    //关注
    UINavigationController *navi2 =[[UINavigationController alloc]initWithRootViewController:[[ConcernTableViewController alloc]initWithNibName:@"ConcernTableViewController" bundle:nil]];
    //目的地
    UINavigationController *navi3 =[[UINavigationController alloc]initWithRootViewController:[[DestinationCollectionViewController alloc]initWithNibName:@"DestinationCollectionViewController" bundle:nil]];
    //我的
    UINavigationController *navi4 =[[UINavigationController alloc]initWithRootViewController:[[MeTableViewController alloc]initWithNibName:@"MeTableViewController" bundle:nil]];
    //中间tabbar的添加
    TabBarPhoto *barPhoto = [[TabBarPhoto alloc]init];
    
    [tab setValue:barPhoto forKey:@"tabBar"];
    [barPhoto.centerBtn addTarget:self action:@selector(clicked:) forControlEvents:(UIControlEventTouchUpInside)];
    
    tab.viewControllers = @[navi1,navi2,navi3,navi4];
    return tab;
}

-(void)clicked:(UIButton *)sender
{
    NSLog(@"sssss");
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
