//
//  MainVC.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/22.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "MainVC.h"
#import "FirstVC.h"
#import "SecondVC.h"
#import "ThirdVC.h"
#import "ZJScrollSegmentView.h"
#import "ZJContentView.h"
#import "HeaderViewForDetailTVC.h"
#import "detail_request.h"

static CGFloat const segmentViewHeight = 44.0;
static CGFloat const naviBarHeight = 64.0;
static CGFloat const headViewHeight = 210.0;
NSString *const ZJParentTableViewDidLeaveFromTopNotification = @"ZJParentTableViewDidLeaveFromTopNotification";


@interface ZJCustomGestureTableView : UITableView

@end

@implementation ZJCustomGestureTableView

/// 返回YES同时识别多个手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]];
}
@end

@interface MainVC ()<ZJScrollPageViewDelegate, ZJPageViewControllerDelegate, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray<NSString *> *titles;
@property (strong, nonatomic) UIView *containerView;
@property (strong, nonatomic) ZJScrollSegmentView *segmentView;
@property (strong, nonatomic) ZJContentView *contentView;
@property (strong, nonatomic) UIView *headView;
@property (strong, nonatomic) UIScrollView *childScrollView;
@property (strong, nonatomic) ZJCustomGestureTableView *tableView;
@property(nonatomic,strong)HeaderViewForDetailTVC * headerView;
@property(nonatomic,strong)detail_request *request_model;
@end
static NSString * const cellID = @"cellID";

@implementation MainVC

#pragma mark- segmentView懒加载
- (ZJScrollSegmentView *)segmentView {
    if (_segmentView == nil) {
        ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
        style.showLine = YES;
        style.scrollTitle = NO;
        // 渐变
        style.gradualChangeTitleColor = YES;
        // 遮盖背景颜色
        style.scrollLineColor = [UIColor redColor];
        style.titleMargin = 20.0;
        //标题一般状态颜色 --- 注意一定要使用RGB空间的颜色值
        style.normalTitleColor =[UIColor colorWithRed:108.0/255.0 green:108.0/255.0 blue:108.0/255.0 alpha:1.0];
        //标题选中状态颜色 --- 注意一定要使用RGB空间的颜色值
        style.selectedTitleColor = [UIColor colorWithRed:235.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
        
        self.titles = @[@"精选",
                        @"分享",
                        @"讨论",
                        ];
        
        // 注意: 一定要避免循环引用!!
        __weak typeof(self) weakSelf = self;
        
        ZJScrollSegmentView *segment = [[ZJScrollSegmentView alloc] initWithFrame:CGRectMake(0, naviBarHeight + self.headerView.height, SCREEN_WIDTH, segmentViewHeight) segmentStyle:style delegate:self titles:self.titles titleDidClick:^(ZJTitleView *titleView, NSInteger index) {
            
            [weakSelf.contentView setContentOffSet:CGPointMake(weakSelf.contentView.bounds.size.width * index, 0.0) animated:YES];
            
        }];
        segment.backgroundColor = [UIColor whiteColor];
        _segmentView = segment;
        
    }
    return _segmentView;
}
#pragma mark --contentView懒加载
- (ZJContentView *)contentView {
    if (_contentView == nil) {
        ZJContentView *content = [[ZJContentView alloc] initWithFrame:self.view.bounds segmentView:self.segmentView parentViewController:self delegate:self];
        _contentView = content;
    }
    return _contentView;
}
#pragma mark --headerView懒加载
-(HeaderViewForDetailTVC *)headerView
{
    if (_headerView==nil) {
        _headerView = [[NSBundle mainBundle]loadNibNamed:@"HeaderViewForDetailTVC" owner:nil options:nil].firstObject;
        [_headerView.headerImageView setImageWithURL:[NSURL URLWithString:self.lists.cover_url] placeholderImage:[UIImage imageNamed:@"default_user_head"]];
        _headerView.headerLabel.text = self.lists.content;
        self.tableView.tableHeaderView = _headerView;
    }
    return _headerView;
}
#pragma mark --tableView懒加载
- (ZJCustomGestureTableView *)tableView {
    if (!_tableView) {
        CGRect frame = CGRectMake(0.0f, naviBarHeight, self.view.bounds.size.width, self.view.bounds.size.height);
        ZJCustomGestureTableView *tableView = [[ZJCustomGestureTableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        // 设置tableView的headView
        tableView.tableHeaderView = self.headerView;
        tableView.tableFooterView = [UIView new];
        // 设置cell行高为contentView的高度
        tableView.rowHeight = self.contentView.bounds.size.height;
        tableView.delegate = self;
        tableView.dataSource = self;
        // 设置tableView的sectionHeadHeight为segmentViewHeight
        tableView.sectionHeaderHeight = segmentViewHeight;
        tableView.showsVerticalScrollIndicator = NO;
        _tableView = tableView;
    }
    
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableView];
//    [self getHtttpData];
}


#pragma ZJScrollPageViewDelegate 代理方法
- (NSInteger)numberOfChildViewControllers {
    return self.titles.count;
}
- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index {
    
    UIViewController<ZJScrollPageViewChildVcDelegate> *childVc = reuseViewController;
    if (!childVc) {
        if (index==0) {
            childVc = [[FirstVC alloc] init];
            FirstVC *vc = (FirstVC *)childVc;
            vc.delegate = self;
            
        } else if(index==1){
            childVc = [[SecondVC alloc] init];
            SecondVC *vc = (SecondVC *)childVc;
            vc.delegate = self;
            
        }else if(index==2){
            childVc = [[ThirdVC alloc] init];
            ThirdVC *vc = (ThirdVC *)childVc;
            vc.delegate = self;
            
        }
        
    }
    return childVc;
}
#pragma mark- ZJPageViewControllerDelegate

- (void)scrollViewIsScrolling:(UIScrollView *)scrollView {
    _childScrollView = scrollView;
    if (self.tableView.contentOffset.y < headViewHeight) {
        scrollView.contentOffset = CGPointZero;
        scrollView.showsVerticalScrollIndicator = NO;
    }
    else {
        self.tableView.contentOffset = CGPointMake(0.0f, headViewHeight);
        scrollView.showsVerticalScrollIndicator = YES;
    }
    
}

#pragma mark- UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.childScrollView && _childScrollView.contentOffset.y > 0) {
        self.tableView.contentOffset = CGPointMake(0.0f, headViewHeight);
    }
    CGFloat offsetY = scrollView.contentOffset.y;
    if(offsetY < headViewHeight) {
        [[NSNotificationCenter defaultCenter] postNotificationName:ZJParentTableViewDidLeaveFromTopNotification object:nil];
        
    }
}
#pragma mark- UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [cell.contentView addSubview:self.contentView];
    
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.segmentView;
}






@end
