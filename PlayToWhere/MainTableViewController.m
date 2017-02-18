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
#import "DetailVC.h"

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
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];

 self.navigationController.navigationBar.barTintColor = [UIColor colorWith255Red:251 green:65 blue:66 alpha:255];
    [self beginLoadNewData];
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
}

-(void)dispatchGetData
{
    //同时开3个线程，来进行并行获取数据
    //创建一个异步传输队列
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //耗时操作
        //section1 数据请求
        [self getHTTPData:@"" andTag:1];
    });
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //耗时操作
        //section2 数据请求
        [self getHTTPData:@"" andTag:2];
    });
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //section3 数据请求
        [self getHTTPData:@"" andTag:3];
    });
}
- (void)getHTTPData:(NSString *)getString andTag:(NSInteger)tag
{
    // get请求也可以直接将参数放在字典里，AFN会自己讲参数拼接在url的后面，不需要自己凭借
    
    //    NSDictionary *param = @{@"user_id":first, @"sale_date":second, @"accessToken":@"e9c0e60318ebd07ec2fe", @"area_type":third};
    NSDictionary *param =[[NSDictionary alloc]init];
    NSString *URL =nil;
    switch (tag) {
        case 1:
            URL = @"http://nahaowan.com/api/v1/collection/list?list=explore&location=%E6%B7%B1%E5%9C%B3&offset=0";
            break;
        case 2:
            URL = @"http://nahaowan.com/api/v1/group/list?list=hot&location=%E6%B7%B1%E5%9C%B3";
            break;
        case 3:
            URL = @"http://nahaowan.com/api/v2/haowan/list/ad?geo=22.6481848889781%2C114.210079510808&location=%E6%B7%B1%E5%9C%B3";
            break;
    }
    // 创建请求类
    AFHTTPSessionManager *manager = [GetHTTPData manager];
    [manager GET:URL parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
        // 这里可以获取到目前数据请求的进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求成功
        if(responseObject){
            
            [self sucess:responseObject  andTag:tag];
             [SVProgressHUD dismiss];
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
            
        } else {
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 请求失败
        
    }];
}

-(void)sucess:(id)responseObject andTag:(NSInteger)tag
{
    if ( tag==1) {
        self.model1  = [SectionTwoToInteresting yy_modelWithJSON:responseObject];
    }else if ( tag==2) {
        self.model2 = [SectionTwoToInteresting yy_modelWithJSON:responseObject];
    }else if (tag==3) {
        self.model3 =[LastSection_model yy_modelWithJSON:responseObject];
    }
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==3) {
        return 11;
    }
        return 1;
}
#pragma mark -单击手势事件
-(void)viewClicked:(buttonAndImageView *)buttonAndImageView
{
    DetailVC *detailVC = [DetailVC new];
    [self presentViewController:detailVC animated:YES completion:nil];
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
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            Data3_Model *datas = [[Data3_Model alloc]init];
            [datas setValuesForKeysWithDictionary:self.model3.data[indexPath.row]];
            
            image_Model *image = [image_Model new];
            [image setValuesForKeysWithDictionary:(NSDictionary*)datas.image];

            [cell.showButton setBackgroundImageForState:UIControlStateNormal withURL:[NSURL URLWithString:image.url] placeholderImage:[UIImage imageNamed:@"default_user_head"]];
        });

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
