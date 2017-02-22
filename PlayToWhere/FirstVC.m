//
//  FirstVC.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/22.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "FirstVC.h"
#import "FirstCellForAllSecondSection.h"
#import "SecondCellForAllSecondSection.h"

@interface FirstVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation FirstVC
-(UITableView *)tableView
{
    if (_tableView ==nil) {
        _tableView =[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView registerNib:[UINib nibWithNibName:@"FirstCellForAllSecondSection" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"Mycell"];
        [_tableView registerNib:[UINib nibWithNibName:@"SecondCellForAllSecondSection" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"Mycell_3"];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 7;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row==0) {
        FirstCellForAllSecondSection *cell = [tableView dequeueReusableCellWithIdentifier:@"Mycell" forIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    else if (indexPath.row==3)
    {
        SecondCellForAllSecondSection *cell = [tableView dequeueReusableCellWithIdentifier:@"Mycell_3" forIndexPath:indexPath];
        return cell;
    }
    UITableViewCell *cell = [UITableViewCell new];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 8;
}

@end
