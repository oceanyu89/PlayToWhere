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
@interface ThirdSectionDetail ()
@property(nonatomic,strong)UIButton *TopRightBtn;
@property(nonatomic,strong)SecondSectionWithoutList *model1;
@property(nonatomic,strong)SecondSectionWithTopic *model2;
@property(nonatomic,strong)listSection *list;
@property(nonatomic,strong)ThirdSecitonHeaderViewForTV *headerView;

@property (nonatomic, strong)  CustomLaoutCell *customCell;
@end

@implementation ThirdSectionDetail
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
    [self beginLoadData];
    [self headerView];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//    [self.tableView registerNib:[UINib nibWithNibName:@"CustomLaoutCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"myCell"];
    
    self.tableView.estimatedRowHeight = 400;  //  随便设个不那么离谱的值
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
}


#pragma mark -刷新加载数据
-(void)loadNewData
{
    [self.tableView.mj_header beginRefreshing];
     [self dispatchLoadNewData];
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
        [self getHttpData:@"http://nahaowan.com/api/v1/group/detail?group_id=2384"andTag:1];
    });
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self getHttpData:@"http://nahaowan.com/api/v1/group/topics?group_id=2384&offset=0"andTag:2];
    });
}
#pragma mark -网络请求
-(void)getHttpData:(NSString *)urlString andTag:(NSInteger)tag
{
    NSDictionary *parameters = [NSDictionary dictionary];
    AFHTTPSessionManager *manager = [GetHTTPData manager];
    [manager GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            
            [self sucess:responseObject andTag:tag];
            [SVProgressHUD dismiss];
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

-(void)sucess:(id)responseObject andTag:(NSInteger)tag
{
    if ( tag==1) {
        self.model1  = [SecondSectionWithoutList yy_modelWithJSON:responseObject];
        self.headerView.titleLabel.text = self.model1.data.title;
        self.headerView.detailLabel.text = self.model1.data.content;
        self.headerView.contentLabel.text = [NSString stringWithFormat:@"%ld条内容",(long)self.model1.data.topic.total];
        self.headerView.attentionLabel.text = [NSString stringWithFormat:@"%ld条内容",(long)self.model1.data.watch.total];
    }else if ( tag==2) {
        self.model2 = [SecondSectionWithTopic yy_modelWithJSON:responseObject];
        
    }
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.model2.data.topics.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        FirstCell *cell = [FirstCell getFirstCell:tableView andImageName:self.model1.data.user.headimg andTitle:self.model1.data.user.username];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
        CustomLaoutCell *cell = [CustomLaoutCell getCustomLayoutCell:tableView andIndexPath:(NSIndexPath *)indexPath];
//        CustomLaoutCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
        NewTopic *topic = [NewTopic new];
        [topic setValuesForKeysWithDictionary:self.model2.data.topics[indexPath.row-1]];
        cell.topic = topic;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

}



@end
