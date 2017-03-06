//
//  RecommendCareTVC.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/28.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "RecommendCareTVC.h"
#import "RecommendCareCell.h"
#import "CareRequest_Model.h"
#import "CollectionViewForCell.h"
@interface RecommendCareTVC ()
@property(nonatomic,strong)CareRequest_Model *careRequest_model;
@end

@implementation RecommendCareTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myView.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.tableView.height = SCREEN_HEIGHT-64;
    self.titleLabel.text = @"推荐关注";
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [self getUtileDataWithHUD];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==1) {
        return (SCREEN_WIDTH-40)/4+16;
    }
    return 44;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.careRequest_model.data.list.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Care_list *list =self.careRequest_model.data.list[indexPath.section];
    if (indexPath.row==0) {
        RecommendCareCell *cell = [RecommendCareCell createRecommendCareCell:tableView];
        cell.list =list;
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell"];
    if (cell==nil) {
        cell = [UITableViewCell new];
    }
    CollectionViewForCell *viewForCell = [[CollectionViewForCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, (SCREEN_WIDTH-40)/4+16)];
    viewForCell.backgroundColor = [UIColor whiteColor];
    //collectionView中的items的项数
    [viewForCell gainNumberOfItemsBlock:^NSInteger(NSInteger section) {
        NSInteger count = list.haowans.count;
        return count;
    }];
    
    //collectionView中item的样子
    [viewForCell gainCellForItemAtIndexBlock:^(CollectionViewCell *cell, NSIndexPath *indexPath) {
        Care_Haowans *haowans=list.haowans[indexPath.item];
//        [cell.imageBtn setImageForState:UIControlStateNormal withURL:[NSURL URLWithString:haowans.image]];
        [cell.imageBtn setBackgroundImageForState:UIControlStateNormal withURL:[NSURL URLWithString:haowans.image]];
    }];

    
    [cell.contentView addSubview:viewForCell];
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        UILabel *showLabel  = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
        showLabel.backgroundColor = [UIColor colorWith255Red:246 green:246 blue:246 alpha:255];
        showLabel.text= @"玩味相投,从关注开始";
        [showLabel setTextAlignment:NSTextAlignmentCenter];
        showLabel.textColor = [UIColor lightGrayColor];
        showLabel.font = kFont(12);
        return showLabel;
    }
    UIView *myView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 5)];
    myView.backgroundColor =[UIColor colorWith255Red:246 green:246 blue:246 alpha:255];
    return myView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 50;
    }
    return 5;
}
-(void)loadNewData
{
      [self getHttpData];
}
-(void)getUtileDataWithHUD
{
    [SVProgressHUD showWithStatus:@"正在加载"];
    [self getHttpData];
}
-(void)getHttpData
{
    NSString *stringURL = @"http://nahaowan.com/api/v3/haowan/recommend/users?geo=22.6481484620617%2C114.210292431415&location=%E6%B7%B1%E5%9C%B3&offset=0&pagesize=20&user_id=9848251";
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [WebUtile requesHttpData:stringURL andSome:dic andReCallData:^(id obj) {
        self.careRequest_model = [CareRequest_Model yy_modelWithJSON:obj];
        [SVProgressHUD dismiss];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    }];
    
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
