//
//  ForthSectionContentView.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/13.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "ForthSectionContentView.h"

@implementation ForthSectionContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 50, 30)];
        title.text = @"精选专题";
        title.font = kFont(12);
        title.textColor = [UIColor redColor];
   
        UITableView *tableVIew = [[UITableView alloc]initWithFrame:CGRectMake(0, 30, SCREEN_WIDTH, frame.size.height-30) style:(UITableViewStyleGrouped)];
        tableVIew.scrollEnabled = NO;
        tableVIew.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self addSubview:title];
        [self addSubview:tableVIew];
        
        tableVIew.delegate = self;
        tableVIew.dataSource = self;
    }
    return self;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *vc = [UIView new];
    vc.backgroundColor  = [UIColor redColor];
    vc.frame = CGRectMake(0, 0, self.frame.size.width, 30);
    return vc;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 11;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"Cell"];
        cell.backgroundColor = [UIColor greenColor];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
