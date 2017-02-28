//
//  FirstVC.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/22.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "FirstVC.h"
#import "FirstCellForAllSecondSection.h"
#import "SecondCellForAllSecondSection.h"
#import "BigImageCollectionView.h"
#import "BigImageIndexCollectionView.h"
#import "DescribeViewForCell.h"
#import "FunctionViewForCell.h"
#import "TalkersCell.h"
#import "TalkAboutCell.h"
@interface FirstVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)detail_data *data;
@end

@implementation FirstVC


-(UITableView *)tableView
{
    if (_tableView ==nil) {
        _tableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-108) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView registerNib:[UINib nibWithNibName:@"FirstCellForAllSecondSection" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"Mycell"];
        [_tableView registerNib:[UINib nibWithNibName:@"SecondCellForAllSecondSection" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"Mycell_3"];
    }
    return _tableView;
}
-(void)viewWillAppear:(BOOL)animated
{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self tableView];
    [self progressHUDGetData];
}
-(void)progressHUDGetData
{
    [SVProgressHUD showWithStatus:@"正在加载"];
    [self getHtttpData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.request_model.data.list.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 7;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==1) {
        return 290;
    }if (indexPath.row==2) {
        detail_list *list =self.request_model.data.list[indexPath.section];
       return  [list textHeight];
    }if (indexPath.row==4) {
        detail_list *list =self.request_model.data.list[indexPath.section];
        return  [list buttonHeight];
    }if (indexPath.row==6) {
        detail_list *list =self.request_model.data.list[indexPath.section];
        return [list talkAboutHeight];
    }

    return 44;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"allCell"];
    if (cell==nil) {
        cell = [UITableViewCell new];
    }
    if (indexPath.row==0) {
        FirstCellForAllSecondSection *cell = [tableView dequeueReusableCellWithIdentifier:@"Mycell" forIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.list = self.request_model.data.list[indexPath.section];
        return cell;
    }else if (indexPath.row==1)
    {

        detail_list *list =self.request_model.data.list[indexPath.section];
        BigImageCollectionView *bigView = [[BigImageCollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
        bigView.itemWidth = SCREEN_WIDTH;
        bigView.minLineSpacing = 0;
        bigView.movieModelArray =list.photos;
        
        BigImageIndexCollectionView*smallView = [[BigImageIndexCollectionView alloc]initWithFrame:CGRectMake(0, 210, SCREEN_WIDTH, 80)];
        smallView.itemWidth = 20;
        smallView.minLineSpacing = 1;
        smallView.movieModelArray = list.photos;
        [cell.contentView addSubview:smallView];
        [cell.contentView addSubview:bigView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [smallView collectionViewDidScrollWithScrollBlock:^(NSIndexPath *indexPath) {
          
            [bigView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }];
        [bigView collectionViewDidScrollWithScrollBlock:^(UICollectionView *scrollView) {
            //这里的百分比是大cell的width/小的cell的width加上间隙
            float rate = 80/SCREEN_WIDTH;
            CGPoint offset = scrollView.contentOffset;
            CGFloat x = offset.x * rate;
            //按照比例设置indexCollView的偏移量
//            offset.y = smallView.contentOffset.y;
            offset.x = x;
            
            [smallView setContentOffset:offset animated:YES];
        }];
        
        return cell;
    }
    else if (indexPath.row==2)
    {
        detail_list *list =self.request_model.data.list[indexPath.section];
        DescribeViewForCell *dv = [[DescribeViewForCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,   [list textHeight])];
        dv.describe = list.title;
         cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.contentView addSubview:dv];
        
    }
    else if (indexPath.row==3)
    {
        SecondCellForAllSecondSection *cell = [tableView dequeueReusableCellWithIdentifier:@"Mycell_3" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (indexPath.row ==4)
    {
        detail_list *list =self.request_model.data.list[indexPath.section];
        FunctionViewForCell *fv = [[FunctionViewForCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, [list buttonHeight])];
        fv.vote_tags = list.vote_tags;

        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.contentView addSubview:fv];
        return cell;
    }else if (indexPath.row==5)
    {
        detail_list *list =self.request_model.data.list[indexPath.section];
        TalkersCell *cell = [TalkersCell getCustomCellAtTalker];
        cell.vote = list.vote;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row==6)
    {
        detail_list *list =self.request_model.data.list[indexPath.section];
        TalkAboutCell *cell = [TalkAboutCell new];
        cell.comment =list.comment;
        return cell;
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 8;
}

#pragma mark -加载网络数据
-(void)getHtttpData
{
    
    NSString *stringURL = @"http://nahaowan.com/api/v2/haowan/list?collection_id=438&list=collection&location=%E6%9C%AC%E5%9C%B0&offset=0&section=%E7%B2%BE%E9%80%89";
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    [WebUtile requesHttpData:stringURL andSome:dic andReCallData:^(id obj) {
        self.request_model = [detail_request yy_modelWithJSON:obj];
        [SVProgressHUD dismiss];
        [self.tableView reloadData];
    }];
    
}











@end
