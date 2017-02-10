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
    
    if (section ==0|| section ==1||section==2) {
        return 1;
    }
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section ==0) {
       FirstSectionCell *cell = [FirstSectionCell FirstSectionCellForMain:tableView];
        cell.delegate = self;
       return cell;
    }
    else if (indexPath.section ==1) {
        SecondSectionXibCell *cell = [SecondSectionXibCell SecondSectionCellForMain:tableView];
        //把SV里面的所有控件先清空一下
        for (UIView *v in cell.secondSectionScrollView.subviews) {
            [v removeFromSuperview];
        }
        
        float size = 110;
        int viewcount = 10;//没有数据，先默认是10
        for (int i=0; i<viewcount; i++) {
            buttonAndImageView *iv = [[buttonAndImageView alloc]initWithFrame:CGRectMake(10+i*(size+10), 10, size, size)];
            iv.backgroundColor = [UIColor redColor];
            
            [cell.secondSectionScrollView addSubview:iv];
        }
        
        cell.secondSectionScrollView.contentSize = CGSizeMake((size+viewcount)*10+10, 0);
       return cell;
    }
    else if(indexPath.section ==2)
    {
        UITableViewCell *cell = [UITableViewCell new];
//        ThirdSectionView *v = [[NSBundle mainBundle]loadNibNamed:@"ThirdSectionView" owner:nil options:nil].firstObject;
        ThirdSectionView_Custom *v = [[ThirdSectionView_Custom alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 260)];
        
        [cell.contentView addSubview:v];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else
    {
        ForthSectionCell *cell =[ForthSectionCell ForthSectionCellForMain:tableView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
}
#pragma mark - 执行FirstSectionCell中按钮的代理方法
-(void)customPushToEatView:(FirstSectionCell *)FirstSectionCell
{

    ContainerViewController *containerVC = [ContainerViewController new];
    [self presentViewController:containerVC animated:YES ];//自定义动画presentViewController
    
}

//分区头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}
//分区里面的cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==1) {
        return 164;
    }
    if (indexPath.section ==2) {
        return 210;
    }
    return 108;
}

@end
