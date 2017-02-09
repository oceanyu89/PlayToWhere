//
//  FirstSectionNavigationController.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/8.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "FirstSectionNavigationController.h"

@interface FirstSectionNavigationController ()

@end

@implementation FirstSectionNavigationController

-(instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        
        self.navigationBar.barTintColor = [UIColor colorWith255Red:251 green:65 blue:66 alpha:255];
        rootViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"wishlist_24x24_"] style:(UIBarButtonItemStyleDone) target:self action:@selector(rightClicked:)];
        [rootViewController.navigationItem.rightBarButtonItem setTintColor:[UIColor whiteColor]];
        
        //设置左按钮
        CustomButton_leftTitleRightImage *btn = [CustomButton_leftTitleRightImage buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 60, 40);
        [btn setTitle:@"深圳" forState:UIControlStateNormal];
        btn.titleLabel.font = kFont(15);
        [btn addTarget:self action:@selector(leftClicked:) forControlEvents:UIControlEventTouchUpInside];
        //对button内的图片底色进行渲染
        [btn setImage:[[UIImage imageNamed:@"pick-list-arrow-down"] imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)] forState:UIControlStateNormal];
        [btn setTintColor:[UIColor whiteColor]];
        UIBarButtonItem *leftbar = [[UIBarButtonItem alloc]initWithCustomView:btn];
        rootViewController.navigationItem.leftBarButtonItem =leftbar;
        
        
        //设置前面图片 不透明
        rootViewController.navigationController.navigationBar.translucent = NO;
        UIButton *searchBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        searchBtn.frame = CGRectMake(0, 0, SCREEN_WIDTH-100, 30);
        searchBtn.backgroundColor =[UIColor whiteColor];
        searchBtn.layer.cornerRadius = 12*SCREEN_WIDTH_RATIO;
        searchBtn.layer.masksToBounds = NO;
        
        //自定义的按钮类型中的title字体设置要用属性字符串进行设置
        NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithString:@"搜寻吃喝玩乐情报"];
        [aString addAttribute:NSFontAttributeName value:kFont(12) range:NSMakeRange(0, aString.length)];
        [aString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor]range:NSMakeRange(0, aString.length)];
        [searchBtn setAttributedTitle:aString forState:(UIControlStateNormal)];
        [searchBtn setImage:[UIImage imageNamed:@"top-action-search_17x17_"] forState:UIControlStateNormal];
        [searchBtn addTarget:self action:@selector(titleViewBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        rootViewController.navigationItem.titleView=searchBtn;
        
    }
    
    return self;
}

#pragma mark - 设置navigation左边按钮点击事件
-(void)leftClicked:(UIButton *)sender
{

}
#pragma mark - 设置navigation中间按钮点击事件
-(void)titleViewBtnClicked:(UIButton *)sender
{
    SearchViewController *searchVC = [SearchViewController new];
    [self presentViewController:searchVC animated:YES completion:nil];
}
#pragma mark -设置NaviagtionController右边按钮点击事件
-(void)rightClicked:(UIBarButtonItem *)sender
{
    
}

#pragma mark - 自定义push功能
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
    
    self.navigationItem.leftBarButtonItem =   [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"navigation-back"]imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate) ] style:(UIBarButtonItemStyleDone) target:self action:@selector(leftBarBtnClicked:)];
    self.navigationBar.tintColor = [UIColor whiteColor];
}
-(void)leftBarBtnClicked:(UIBarButtonItem *)sender
{
    [self popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
