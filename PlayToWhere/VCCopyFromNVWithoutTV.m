//
//  VCCopyFromNVWithoutTV.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/22.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "VCCopyFromNVWithoutTV.h"

@interface VCCopyFromNVWithoutTV ()

@end

@implementation VCCopyFromNVWithoutTV


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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self myView];
    [self backBtn];
    [self titleLabel];

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
