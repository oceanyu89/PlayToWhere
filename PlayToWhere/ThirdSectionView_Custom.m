//
//  ThirdSectionView_Custom.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/10.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "ThirdSectionView_Custom.h"

@implementation ThirdSectionView_Custom


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 50, 30)];
        title.text = @"话题";
        title.font = kFont(12);
        title.textColor = [UIColor redColor];
        
        UILabel *note = [[UILabel alloc]initWithFrame:CGRectMake(70, 0, 100, 30)];
        note.text = @"我的话题 ";
        note.font = kFont(12);
        note.textColor = [UIColor grayColor];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(SCREEN_WIDTH-80, 0, 50, 30);
        [btn setTitle:@"更多" forState:UIControlStateNormal];
        btn.titleLabel.font = kFont(12);
        [btn addTarget:self action:@selector(moreBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];

        
        UITableView *tableVIew = [[UITableView alloc]initWithFrame:CGRectMake(0, 30, SCREEN_WIDTH, frame.size.height-30) style:(UITableViewStyleGrouped)];
        tableVIew.scrollEnabled = NO;
        tableVIew.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self addSubview:title];
        [self addSubview:note];
        [self addSubview:btn];
        [self addSubview:tableVIew];

        tableVIew.delegate = self;
        tableVIew.dataSource = self;
    }
    return self;
}

-(void)moreBtnClicked:(UIButton * )sender
{
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCellWithAcessoryImage *cell = [CustomCellWithAcessoryImage initWithCustomWithAccessoryView:@"" andTitle:@"测试" andDetail:@"测试" andAccessoryImageName:@""];

    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
