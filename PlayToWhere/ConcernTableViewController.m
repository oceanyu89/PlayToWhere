//
//  ConcernTableViewController.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/1/16.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "ConcernTableViewController.h"
#import "CareRequest_Model.h"
#import "ZeroSectionCell.h"
#import "CareBtn.h"
#import "CustomButton_leftTitleRightImage.h"

#import "FirstCellForAllSecondSection.h"
#import "SecondCellForAllSecondSection.h"
#import "BigImageCollectionView.h"
#import "BigImageIndexCollectionView.h"
#import "DescribeViewForCell.h"
#import "FunctionViewForCell.h"
#import "detail_request.h"
#import "TalkersCell.h"
#import "TalkAboutCell.h"
#import "RecommendCareTVC.h"
static NSString *const cellID =@"reuseIdentifier";

@interface ConcernTableViewController ()
@property (strong, nonatomic) IBOutlet UIView *firstSectionHeaderView;
@property(nonatomic,strong)CareRequest_Model *careRequest_model;
@property(nonatomic,strong)detail_request *request_model;
@end

@implementation ConcernTableViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"关注";//tabBarItem.
        self.tabBarItem.image = [UIImage imageNamed:@"tab-feed_26x26_"];
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab-feed-select_26x26_"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return self;
}
- (IBAction)moreList:(id)sender {
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getUtileDataWithHUD];
    [self.tableView registerNib:[UINib nibWithNibName:@"FirstCellForAllSecondSection" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"Mycell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"SecondCellForAllSecondSection" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"Mycell_3"];
//    [self.tableView registerClass:[ZeroSectionCell class] forCellReuseIdentifier:@"zeroCell"];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.request_model.data.list.count+1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 2;
    }
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Care_list *list = self.careRequest_model.data.list[0];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID ];
    if (cell==nil) {
        cell = [UITableViewCell new];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (indexPath.section==0) {
        if(indexPath.row==0)
        {
            ZeroSectionCell *cell = [ZeroSectionCell createZeroSectionCell:tableView];
            cell.list = list;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else
        {
            CustomButton_leftTitleRightImage *btn = [CustomButton_leftTitleRightImage buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(SCREEN_WIDTH*0.5-50, 11, 100, 20);
            [btn setTitle:@"查看更多" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(toMoreClicked:) forControlEvents:UIControlEventTouchUpInside];
            btn.titleLabel.font = kFont(12);
            
            [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"pick-list-arrow-rignt"] forState:UIControlStateNormal];
            [cell.contentView addSubview:btn];
            return cell;
        }

    }
    if (indexPath.row==0) {
        FirstCellForAllSecondSection *cell = [tableView dequeueReusableCellWithIdentifier:@"Mycell" forIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.list = self.request_model.data.list[indexPath.section-1];
        return cell;
    }else if (indexPath.row==1)
    {
        
        detail_list *list =self.request_model.data.list[indexPath.section-1];
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
        detail_list *list =self.request_model.data.list[indexPath.section-1];
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
        detail_list *list =self.request_model.data.list[indexPath.section-1];
        FunctionViewForCell *fv = [[FunctionViewForCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, [list buttonHeight])];
        fv.vote_tags = list.vote_tags;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.contentView addSubview:fv];
        return cell;
    }else if (indexPath.row==5)
    {
        detail_list *list =self.request_model.data.list[indexPath.section-1];
        TalkersCell *cell = [TalkersCell getCustomCellAtTalker];
        cell.vote = list.vote;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row==6)
    {
        detail_list *list =self.request_model.data.list[indexPath.section-1];
        TalkAboutCell *cell = [TalkAboutCell new];
        cell.comment =list.comment;
        return cell;
    }


    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
         return 44;
    }
    else
    {
        if (indexPath.row==1) {
            return 290;
        }if (indexPath.row==2) {
            detail_list *list =self.request_model.data.list[indexPath.section-1];
            return  [list textHeight];
        }if (indexPath.row==4) {
            detail_list *list =self.request_model.data.list[indexPath.section-1];
            return  [list buttonHeight];
        }if (indexPath.row==6) {
            detail_list *list =self.request_model.data.list[indexPath.section-1];
            return [list talkAboutHeight];
        }
        return 44;
    }

}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return self.firstSectionHeaderView;
    }
    UIView *myView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 5)];
    myView.backgroundColor =[UIColor colorWith255Red:246 green:246 blue:246 alpha:255];
    return myView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 30;
    }
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 2;
}
-(void)getUtileDataWithHUD
{
    [SVProgressHUD showWithStatus:@"正在加载"];
    [self getHttpData];
}
-(void)getHttpData
{
    NSString *stringURL = @"http://nahaowan.com/api/v3/haowan/recommend/users?";
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"geo"] = @"22.6482293050552%2C114.210223965175";
    dic[@"location"] = @"%E6%B7%B1%E5%9C%B3";
    dic[@"offset"] = @"0";
    dic[@"pagesize"] = @"20";
    dic[@"user_id"] = @"9848251";

    [WebUtile requesHttpData:stringURL andSome:dic andReCallData:^(id obj) {
        self.careRequest_model = [CareRequest_Model yy_modelWithJSON:obj];

    }];
    
    stringURL =  @"http://nahaowan.com/api/v2/haowan/list?collection_id=438&list=collection&location=%E6%9C%AC%E5%9C%B0&offset=0&section=%E7%B2%BE%E9%80%89";
    NSMutableDictionary *dic2 = [NSMutableDictionary dictionary];
    
    [WebUtile requesHttpData:stringURL andSome:dic2 andReCallData:^(id obj) {
        self.request_model = [detail_request yy_modelWithJSON:obj];
        [SVProgressHUD dismiss];
        [self.tableView reloadData];
    }];
    
    
}
-(void)toMoreClicked:(UIButton*)sender
{
    RecommendCareTVC *recommend = [RecommendCareTVC new];
    recommend.data = self.careRequest_model.data;
    [self presentViewController:recommend animated:YES completion:nil];
}

@end
