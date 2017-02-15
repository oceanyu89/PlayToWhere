//
//  CustomHeaderSectionView.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/1/17.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "CustomHeaderSectionView.h"

@implementation CustomHeaderSectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(UIView*)customHeaderSectionView:(UITableView *)tableview andSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]init];
    if (section==0) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, tableview.frame.size.width, 20)];
        label.text = @"附近";
        
        label.textColor = [UIColor redColor];
        label.font = kFont(12);
        [view addSubview:label];
    }
    if (section==1) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 50, 30)];
        label.text = @"兴趣圈";
        label.textColor = [UIColor redColor];
        label.font = kFont(12);
        
        UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(70, 0, 70, 30)];
        label2.text = @"我的圈子";
        label2.textColor = [UIColor grayColor];
        label2.font = kFont(12);
        
        UIButton *button = [UIButton buttonWithType:(UIButtonTypeSystem)];
        button.frame = CGRectMake(tableview.frame.size.width - 80, 0, 70, 30);
        [button setTitle:@"更多" forState:UIControlStateNormal];
        button.titleLabel.font =kFont(12);
        [button setTintColor:[UIColor redColor]];
        
        [view addSubview:label];
        [view addSubview:label2];
        [view addSubview:button];
    }
    if (section ==2) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 50, 30)];
        label.text = @"话题";
        label.textColor = [UIColor redColor];
        label.font = kFont(12);
        
        UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(70, 0, 70, 30)];
        label2.text = @"我的话题";
        label2.textColor = [UIColor grayColor];
        label2.font = kFont(12);
        
        UIButton *button = [UIButton buttonWithType:(UIButtonTypeSystem)];
        button.frame = CGRectMake(tableview.frame.size.width - 80, 0, 70, 30);
        [button setTitle:@"更多" forState:UIControlStateNormal];
        button.titleLabel.font =kFont(12);
        [button setTintColor:[UIColor redColor]];
        
        [view addSubview:label];
        [view addSubview:label2];
        [view addSubview:button];

    }
    if (section ==3) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, tableview.frame.size.width, 30)];
        label.text = @"精选专题";
        
        label.textColor = [UIColor redColor];
        label.font = kFont(12);
        view.backgroundColor = [UIColor whiteColor];
        [view addSubview:label];
        
    }
    return view;
    
}
@end
