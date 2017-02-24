//
//  MainTableViewController.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/1/16.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "MainTableViewController.h"
#import "CustomHeaderSectionView.h"
#import "SectionTwoToInteresting.h"
#import "list_model.h"
#import "listSection.h"
#import "LastSection_model.h"
#import "ThirdSectionSonVC.h"
#import "ThirdSectionDetail.h"
#import "MainVC.h"

static NSString * const identifier = @"myCell";
@interface MainTableViewController ()<FirstSectionCellDelegate,ThirdSectionView_CustomDelegate,buttonAndImageViewDelegate>
@property(nonatomic,strong)FirstSectionCell *cell;
@property(nonatomic,strong)SectionTwoToInteresting *model1;
@property(nonatomic,strong)SectionTwoToInteresting *model2;
@property(nonatomic,strong)LastSection_model *model3;
@property (nonatomic,assign) NSInteger cellHeight;
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
    [self beginLoadNewData];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];

 self.navigationController.navigationBar.barTintColor = [UIColor colorWith255Red:251 green:65 blue:66 alpha:255];

}

#pragma mark -下拉刷新操作
-(void)loadNewData
{
    [self.tableView.mj_header beginRefreshing];
    [self dispatchGetData];
    
  }
-(void)beginLoadNewData
{
    [SVProgressHUD showWithStatus:@"正在加载"];
   [self dispatchGetData];

//    [self loadNewData];
}


-(void)dispatchGetData
{
        //section1 数据请求
        NSString *stringURL = @"http://nahaowan.com/api/v1/collection/list?list=explore&location=%E6%B7%B1%E5%9C%B3&offset=0";
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [WebUtile requesHttpData:stringURL andSome:dic andReCallData:^(id obj) {
            self.model1  = [SectionTwoToInteresting yy_modelWithJSON:obj];
            [self.tableView reloadData];
        }];

        //section2 数据请求
        stringURL =@"http://nahaowan.com/api/v1/group/list?list=hot&location=%E6%B7%B1%E5%9C%B3";
//             NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [WebUtile requesHttpData:stringURL andSome:dic andReCallData:^(id obj) {
            self.model2 = [SectionTwoToInteresting yy_modelWithJSON:obj];
            [self.tableView reloadData];
        }];
        //section3 数据请求
        stringURL =@"http://nahaowan.com/api/v2/haowan/list/ad?geo=22.6481848889781%2C114.210079510808&location=%E6%B7%B1%E5%9C%B3";
//            NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [WebUtile requesHttpData:stringURL andSome:dic andReCallData:^(id obj) {
            self.model3 =[LastSection_model yy_modelWithJSON:obj];
            [SVProgressHUD dismiss];
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
        }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==3) {
        return self.model3.data.count;
    }
        return 1;
}
#pragma mark -单击手势事件
-(void)viewClicked:(buttonAndImageView *)buttonAndImageView andLists:(list_model *)lists
{
        MainVC *home = [MainVC new];
        home.lists = lists;
        [self presentViewController:home animated:YES completion:nil];
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
            NSInteger viewcount = self.model1.data.list.count; //没有数据，先默认是10
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            for (int i=0; i<viewcount; i++) {
                buttonAndImageView *iv = [[buttonAndImageView alloc]initWithFrame:CGRectMake(10+i*(size+10), 10, size, size)];
                iv.delegate = self;
                list_model *lists =[[list_model alloc]init];
                [lists setValuesForKeysWithDictionary:self.model1.data.list[i]];
                Haowan *haowan =[[Haowan alloc]init];
                [haowan setValuesForKeysWithDictionary:(NSDictionary*)lists.haowan];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [iv createSomeView:lists.icon_url andTitle:lists.title andNote:[NSString stringWithFormat:@"%ld精选",(long)haowan.total]];
                    iv.lists = lists;
                    [cell.secondSectionScrollView addSubview:iv];
                });
            }
        });

         cell.secondSectionScrollView.contentSize = CGSizeMake((size+viewcount)*10+10, 0);
        [cell setNeedsLayout];
       return cell;
    }
    else if(indexPath.section ==2)
    {
        UITableViewCell *cell = [UITableViewCell new];
        ThirdSectionView_Custom *v = [[ThirdSectionView_Custom alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 260)];
        v.lists = self.model2.data.list;
        v.delegate = self;
        [cell.contentView addSubview:v];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setNeedsLayout];
        return cell;
    }
    else if(indexPath.section ==3)
    {
        ForthSectionCell *cell = [ForthSectionCell ForthSectionCellForMain:tableView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        Data3_Model *datas = [[Data3_Model alloc]init];
        [datas setValuesForKeysWithDictionary:self.model3.data[indexPath.row]];
        
        image_Model *image = [image_Model new];
        [image setValuesForKeysWithDictionary:(NSDictionary*)datas.image];

        [cell.showButton setBackgroundImageForState:UIControlStateNormal withURL:[NSURL URLWithString:image.url] placeholderImage:[UIImage imageNamed:@"default_user_head"]];
        return cell;
    }
    else
        return nil;
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
    if (section ==3) {
        return 30;
    }
    return 1;
//    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return section==3?[CustomHeaderSectionView customHeaderSectionView:tableView andSection:3]:nil;
    
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
    if (indexPath.section ==3) {
        return 250;
        
    }
    return 108;
}
#pragma mark -第三个section中的点击事件，通过代理这里实现
-(void)clickMoreButton // 更多
{
    ThirdSectionSonVC *sonVC = [[ThirdSectionSonVC alloc]init];
    [self presentViewController:sonVC animated:YES];
//    [self.navigationController pushViewController:sonVC animated:YES];
}
//cell的点击事件
-(void)didSelectCellForRowIndex:(UITableView *)tableView andIndexPath:(NSIndexPath *)indexPath andTitle:(NSString *)title

{
    ThirdSectionDetail *detailVC = [ThirdSectionDetail new];
    detailVC.title = title;
//    [self presentViewController:detailVC animated:YES];
    [self presentViewController:detailVC animated:YES completion:nil];
}
@end
