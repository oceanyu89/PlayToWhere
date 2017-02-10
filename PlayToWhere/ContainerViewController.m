//
//  ContainerViewController.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/9.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "ContainerViewController.h"

@interface ContainerViewController ()<YUHYContainerViewControllerDelegate>

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    EatViewController *eatVC = [[EatViewController alloc]initWithNibName:@"EatViewController" bundle:nil];
    eatVC.title = @"附近的地点";
    NearPeopleTableViewController *peopleVC = [[NearPeopleTableViewController alloc]initWithNibName:@"NearPeopleTableViewController" bundle:nil];
    peopleVC.title = @"附近的人";
    // ContainerView
    float statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    float navigationHeight = self.navigationController.navigationBar.frame.size.height;
    
    YUHYContainerViewController *containerVC = [[YUHYContainerViewController alloc]initWithControllers:@[eatVC,peopleVC]
                                                                                        topBarHeight:statusHeight + navigationHeight
                                                                                parentViewController:self];
    containerVC.delegate = self;
    containerVC.menuItemFont = [UIFont fontWithName:@"Futura-Medium" size:16];
    containerVC.menuItemSelectedTitleColor = [UIColor redColor];
    containerVC.menuIndicatorColor = [UIColor redColor];
    [self.view addSubview:containerVC.view];

}

#pragma mark -- YUHYContainerViewControllerDelegate
- (void)containerViewItemIndex:(NSInteger)index currentController:(UIViewController *)controller
{
//        NSLog(@"current Index : %ld",(long)index);
//        NSLog(@"current controller : %@",controller);
    [controller viewWillAppear:YES];
}

@end
