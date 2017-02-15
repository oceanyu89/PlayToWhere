//
//  ThirdSectionDetail.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/14.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "ThirdSectionDetail.h"

@interface ThirdSectionDetail ()
@property(nonatomic,strong)UIButton *TopRightBtn;
@end

@implementation ThirdSectionDetail
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
