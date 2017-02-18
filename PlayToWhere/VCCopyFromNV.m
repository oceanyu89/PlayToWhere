//
//  VCCopyFromNV.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/14.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "VCCopyFromNV.h"

@interface VCCopyFromNV ()

@end

@implementation VCCopyFromNV

-(UIView *)myView
{
    if (_myView ==nil) {
        _myView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _myView.backgroundColor = [UIColor colorWith255Red:231 green:231 blue:231 alpha:255];
        
        [self.view addSubview:_myView];
    }
    return _myView;
}
-(UIButton *)backBtn
{
    if (_backBtn==nil) {
        _backBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.frame = CGRectMake(10, 30, 30 , 30);
        [_backBtn setBackgroundImage:[UIImage imageNamed:@"navigation-back"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(backClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.myView addSubview:_backBtn];
    }
    return _backBtn;
}
-(void)backClicked:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(UILabel *)titleLabel
{
    if (_titleLabel==nil) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 30, SCREEN_WIDTH-70, 30)];
        _titleLabel.text = @"热点话题";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = kFont(15);
        [self.myView addSubview:_titleLabel];
    }
    return _titleLabel;
}
-(UITableView *)tableView
{
    if (_tableView ==nil) {
        _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-60) style:UITableViewStylePlain];
        
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self myView];
    [self backBtn];
    [self titleLabel];
    [self tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
