//
//  SearchViewController.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/8.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBtn;
@property(nonatomic,strong)NSMutableArray *searchHistorys;
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation SearchViewController
-(UITableView *)tableView
{
    if (_tableView ==nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.backView.bounds.size.height, SCREEN_WIDTH, 230) style:(UITableViewStyleGrouped)];
        _tableView.delegate = self;
        _tableView.dataSource =self;

        [self.view addSubview:_tableView];
    }
    return _tableView;
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"开始搜索");
     
    [self saveHistory:searchBar.text];
}
#pragma mark - saveHistory
-(void)saveHistory:(NSString *)string
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSArray *array = [ud arrayForKey:@"searchHistory"];
    NSMutableArray *marray = [NSMutableArray arrayWithArray:array];
    [marray addObject:string];
    [ud setObject:marray forKey:@"searchHistory"];
    [ud synchronize];
}
#pragma mark - readHistory
-(NSArray*)readHistory
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSArray *array = [ud arrayForKey:@"searchHistory"];

    return array;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self tableView];
    
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"搜索历史";
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([self readHistory].count>0) {
        return 1;
    }
    return 0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self readHistory].count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    cell.textLabel.text = [self readHistory][indexPath.row];
    
//    cell.backgroundColor = [UIColor greenColor];
    return cell;
}

- (IBAction)cancel:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
