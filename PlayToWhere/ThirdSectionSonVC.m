//
//  ThirdSectionSonVC.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/14.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "ThirdSectionSonVC.h"

@interface ThirdSectionSonVC ()
@property(nonatomic,strong)SectionTwoToInteresting *model;

@property(nonatomic,strong)UIView *mylowView;
@property(nonatomic,strong)UIButton *lowBtn;
@end

@implementation ThirdSectionSonVC

-(UIView *)mylowView
{
    if (_mylowView==nil) {
        _mylowView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-50,SCREEN_WIDTH, 50)];
        _mylowView.backgroundColor = [UIColor colorWith255Red:231 green:231 blue:231 alpha:255];
        
        [self.view addSubview:_mylowView];
    }
    return _mylowView;
}
-(UIButton *)lowBtn
{
    if (_lowBtn ==nil) {
        _lowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _lowBtn.frame = CGRectMake(0, 0, SCREEN_WIDTH, 50) ;
        [_lowBtn setTitle:@"发起一个新话题" forState:UIControlStateNormal];
        
        [_lowBtn setImage: [UIImage imageNamed:@"add-quan_20x20_"] forState:UIControlStateNormal];
        _lowBtn.titleLabel.font = kFont(14);
        [_lowBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
        [_lowBtn addTarget:self action:@selector(addNewAnswer:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.mylowView addSubview:_lowBtn];
    }
    return _lowBtn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self mylowView];
    [self lowBtn];
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
    self.titleLabel.text = @"发现话题";
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
//    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    [self beginLoadNewData];
    
}

-(void)addNewAnswer:(UIButton*)sender
{
    
}

//
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
    //创建一个异步传输队列
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //耗时操作
        //section1 数据请求
        [self getHTTPData:@"http://nahaowan.com/api/v1/group/list?list=explore&location=%E6%B7%B1%E5%9C%B3&pagesize=20" andTag:1];
    });
}
- (void)getHTTPData:(NSString *)getString andTag:(NSInteger)tag
{
    // get请求也可以直接将参数放在字典里，AFN会自己讲参数拼接在url的后面，不需要自己凭借
    
    //    NSDictionary *param = @{@"user_id":first, @"sale_date":second, @"accessToken":@"e9c0e60318ebd07ec2fe", @"area_type":third};
    NSDictionary *param =[[NSDictionary alloc]init];
    // 创建请求类
    AFHTTPSessionManager *manager = [GetHTTPData manager];
    [manager GET:getString parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
        // 这里可以获取到目前数据请求的进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求成功
        if(responseObject){
            
           self.model =[SectionTwoToInteresting yy_modelWithJSON:responseObject];
            self.lists = self.model.data.list;
            [SVProgressHUD dismiss];
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
            
        } else {
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 请求失败
        
    }];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.lists.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    listSection*lists =[[listSection alloc]init];
    [lists setValuesForKeysWithDictionary:self.lists[indexPath.row]];
    User *user =[[User alloc]init];
    [user setValuesForKeysWithDictionary:(NSDictionary*)lists.user];
    Topic *topic = [Topic new];
    [topic setValuesForKeysWithDictionary:(NSDictionary*)lists.topic];
    CustomCellWithAcessoryImage *cell = [CustomCellWithAcessoryImage initWithCustomWithAccessoryView: lists.icon_url andTitle: lists.title andDetail:[NSString stringWithFormat:@"%ld条内容" ,(long)topic.total] andAccessoryImageName:user.headimg];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
    return cell;
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
