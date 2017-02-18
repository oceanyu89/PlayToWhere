//
//  DetailVC.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/18.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "DetailVC.h"

@interface DetailVC ()
@property(nonatomic,strong)UIButton *TopRightBtn;
@property(nonatomic,strong)UIButton *careBtn;
@end

@implementation DetailVC

-(UIButton *)careBtn
{
    if (_careBtn==nil) {
        _careBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        _careBtn.frame = CGRectMake(self.TopRightBtn.left-60, 30, 60 , 30);
        [_careBtn.layer setCornerRadius:6*SCREEN_WIDTH_RATIO ] ;
        _careBtn.layer.borderColor = [UIColor redColor].CGColor;
        _careBtn.layer.masksToBounds = YES;
        [_careBtn setImage:[UIImage imageNamed:@"add-question_14x14_"] forState:UIControlStateNormal];

        [_careBtn setTitle:@"关注" forState:UIControlStateNormal];
        _careBtn.titleLabel.font = kFont(12);
        [_careBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self.myView addSubview:_careBtn];
    }
    return _careBtn;
}
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
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    return cell;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self careBtn];
}



@end
