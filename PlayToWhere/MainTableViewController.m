//
//  MainTableViewController.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/1/16.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "MainTableViewController.h"

static NSString * const identifier = @"myCell";
@interface MainTableViewController ()<FirstSectionCellDelegate>
@property(nonatomic,strong)FirstSectionCell *cell;
@end

@implementation MainTableViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"哪好玩";
        self.tabBarItem.image =[UIImage imageNamed:@"tab-find_26x26_"] ;
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab-find-select_26x26_"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWith255Red:251 green:65 blue:66 alpha:255];
    
}
#pragma mark -下拉刷新操作
-(void)loadNewData
{
    [self.tableView.mj_header endRefreshing];
}
#pragma mark - 上拉刷新操作
-(void)loadMoreData
{
    [self.tableView.mj_footer endRefreshing];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section ==0|| section ==1) {
        return 1;
    }
    else if (section==2)
    {
        return 4;
    }
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    UITableViewCell* cell = nil;
    if (indexPath.section ==0) {
       FirstSectionCell *cell = [FirstSectionCell FirstSectionCellForMain:tableView];
        cell.delegate = self;
       return cell;
    }
    else if (indexPath.section ==1) {
        SecondSectionCell *cell = [SecondSectionCell SecondSectionCellForMain:tableView];
       return cell;
    }
    else if(indexPath.section ==2)
    {
       ThirdSectionCell* cell =[ThirdSectionCell ThirdSectionCellForMain:tableView];
        return cell;
    }
    else
    {
        ForthSectionCell *cell =[ForthSectionCell ForthSectionCellForMain:tableView];
        return cell;
    }
    
}
#pragma mark - 执行FirstSectionCell中按钮的代理方法
-(void)customPushToEatView:(FirstSectionCell *)FirstSectionCell
{
//    EatViewController *eatVC = [[EatViewController alloc]initWithNibName:@"EatViewController" bundle:nil];
//    [self.navigationController pushViewController:eatVC animated:YES];
    
    ContainerViewController *containerVC = [ContainerViewController new];
//    [self.navigationController pushViewController:containerVC animated:YES];
    [self presentViewController:containerVC animated:YES completion:nil];
}

/**
 设置表视图分区头view

 @param tableView tableView
 @param section 分区
 @return 返回一个view类型
 */
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    return [CustomHeaderSectionView customHeaderSectionView:tableView andSection:section];
}
//分区头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section ==1||section==2||section==3) {
        return 30;
    }
    return 20;
}
//分区里面的cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==1) {
        return 140;
    }
    if (indexPath.section ==2) {
        return 40;
    }
    return 85;
}

@end
