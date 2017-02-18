//
//  ThirdSectionDetail.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/14.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "ThirdSectionDetail.h"
#import "ThirdSecitonHeaderViewForTV.h"
#import "SecondSectionWithoutList.h"
#import "FirstCell.h"
#import "CustomLaoutCell.h"
#import "SecondSectionWithTopic.h"
#import "CustomCommentCell.h"

@interface ThirdSectionDetail ()
@property(nonatomic,strong)UIButton *TopRightBtn;
@property(nonatomic,strong)SecondSectionWithoutList *model1;
@property(nonatomic,strong)SecondSectionWithTopic *model2;
@property(nonatomic,strong)SecondSectionWithTopic *modeltemp;
@property(nonatomic,strong)listSection *list;
@property(nonatomic,strong)ThirdSecitonHeaderViewForTV *headerView;

@property (nonatomic, strong)  CustomLaoutCell *customCell;
@property(nonatomic,strong)NewTopic *topic;
@property(nonatomic,strong)Comment *comment;
@property(nonatomic,strong)NSMutableArray *topics;
@end

@implementation ThirdSectionDetail



-(NSMutableArray *)topics
{
    if (_topics==nil) {
        _topics = [NSMutableArray array];
    }
    return _topics;
}
-(NewTopic *)topic
{
    if (_topic==nil) {
        _topic = [NewTopic new];
    }
    return _topic;
}
-(Comment *)comment
{
    if (_comment==nil) {
        _comment = [Comment new];
    }
    return _comment;
}
-(UIView *)headerView
{
    if (_headerView==nil) {
        NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"ThirdSecitonHeaderViewForTV" owner:nil options:nil];
        _headerView = [array lastObject];
        
        _headerView.attentionBtn.layer.borderColor = [UIColor redColor].CGColor;//设置按钮的边框颜色
        [_headerView.attentionBtn.layer setBorderWidth:1];
        _headerView.attentionBtn.layer.cornerRadius = 6*SCREEN_WIDTH_RATIO;
        self.tableView.tableHeaderView = _headerView;
    }
    return _headerView;
}
-(UIButton *)TopRightBtn
{
    if (_TopRightBtn ==nil) {
        _TopRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _TopRightBtn.frame = CGRectMake(SCREEN_WIDTH-40, 30, 30 , 30);
        [_TopRightBtn setBackgroundImage:[UIImage imageNamed:@"quan-share_24x24_"] forState:UIControlStateNormal];
        [_TopRightBtn addTarget:self action:@selector(shareClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.myView addSubview:_TopRightBtn];
    }
    return _TopRightBtn;
}
-(void)shareClicked:(UIButton *)sender
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self TopRightBtn];
    self.titleLabel.text = self.title;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData) ];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    [self beginLoadData];
    [self headerView];

    self.tableView.estimatedRowHeight = 400;  //  随便设个不那么离谱的值
    self.tableView.rowHeight = UITableViewAutomaticDimension;
   self.tableView.height = SCREEN_HEIGHT-64;
    self.tableView.mj_footer.hidden = YES;
    self.tableView.tableHeaderView.height=110;
}
#pragma mark -控制表尾刷新
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    // 当最后一个cell完全显示在眼前时，contentOffset的y值
    CGFloat judgeOffsetY = scrollView.contentSize.height + scrollView.contentInset.bottom - scrollView.height - self.tableView.tableFooterView.height;
    if (offsetY >= judgeOffsetY) { // 最后一个cell完全进入视野范围内
        // 显示footer
        self.tableView.mj_footer.hidden = NO;
        
    }
}

#pragma mark -刷新加载数据
-(void)loadNewData
{
    [self.tableView.mj_header beginRefreshing];
     [self dispatchLoadNewData];
}
#pragma mark - 加载更多数据
-(void)loadMoreData
{
    
//        [self.tableView.mj_footer beginRefreshing];
    NSInteger pos = self.model2.data.pos;
    NSString*urlString = @"http://nahaowan.com/api/v1/group/topics?";
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"group_id"] = @"2384";
    parameters[@"offset"] = @(pos).stringValue;
    
    [WebUtile requesHttpData:urlString andSome:parameters andReCallData:^(id obj) {
        self.model2 = [SecondSectionWithTopic yy_modelWithJSON:obj];
        //            self.topics = [self.modeltemp.data.topics mutableCopy];
        [self.topics addObjectsFromArray:self.model2.data.topics];
        [SVProgressHUD dismiss];
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
        self.tableView.mj_footer.hidden = YES;
    }];
//    AFHTTPSessionManager *manager = [GetHTTPData manager];
//    [manager GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        if (responseObject) {
//            
//            self.model2 = [SecondSectionWithTopic yy_modelWithJSON:responseObject];
////            self.topics = [self.modeltemp.data.topics mutableCopy];
//            [self.topics addObjectsFromArray:self.model2.data.topics];
//            [SVProgressHUD dismiss];
//            [self.tableView reloadData];
//           [self.tableView.mj_footer endRefreshing];
//         self.tableView.mj_footer.hidden = YES;
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//    }];

}

#pragma mark -开线程加载数据
-(void)beginLoadData
{
    [SVProgressHUD showWithStatus:@"正在加载"];
    [self dispatchLoadNewData];
}
#pragma mark -开线程加载数据
-(void)dispatchLoadNewData
{

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSString *stringURL =@"http://nahaowan.com/api/v1/group/detail?group_id=2384";
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [WebUtile requesHttpData:stringURL andSome:dic andReCallData:^(id obj) {
            self.model1  = [SecondSectionWithoutList yy_modelWithJSON:obj];
            self.headerView.titleLabel.text = self.model1.data.title;
            self.headerView.detailLabel.text = self.model1.data.content;
            self.headerView.contentLabel.text = [NSString stringWithFormat:@"%ld条内容",(long)self.model1.data.topic.total];
            self.headerView.attentionLabel.text = [NSString stringWithFormat:@"%ld条内容",(long)self.model1.data.watch.total];
            [SVProgressHUD dismiss];
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
        }];
    });
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSString *stringURL =@"http://nahaowan.com/api/v1/group/topics?group_id=2384&offset=0";
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [WebUtile requesHttpData:stringURL andSome:dic andReCallData:^(id obj) {
            self.model2 = [SecondSectionWithTopic yy_modelWithJSON:obj];
            self.topics = [self.model2.data.topics mutableCopy];
            [SVProgressHUD dismiss];
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
        }];

    });
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
      return self.topics.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }
    NewTopic* topic = [NewTopic new];
    [topic setValuesForKeysWithDictionary:self.topics[section-1]];
    [self.comment setValuesForKeysWithDictionary:(NSDictionary *)topic.comment];
    if(self.comment.total>0)
    {
        return 2;
    }
    
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        FirstCell *cell = [FirstCell getFirstCell:tableView andImageName:self.model1.data.user.headimg andTitle:self.model1.data.user.username];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }


     [self.topic setValuesForKeysWithDictionary:self.topics[indexPath.section-1]];
    Comment *comment = [Comment new];
    [comment setValuesForKeysWithDictionary:(NSDictionary *)self.topic.comment];
    if (indexPath.row==0) {
        CustomLaoutCell *cell = [CustomLaoutCell getCustomLayoutCell:tableView andIndexPath:(NSIndexPath *)indexPath];
       
        cell.topic = self.topic;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else
    {
        CustomCommentCell *cell = [CustomCommentCell getCustomLayoutCell:tableView andIndexPath:indexPath];
        cell.comment = comment;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }

    
}

@end
