//
//  LocationPlist.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/3/1.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "LocationPlist.h"
#import "HomeHereCell.h"
#import "AddressModel.h"
#import "HotsLocationCell.h"
@interface LocationPlist ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *locationName;
@property(nonatomic,strong)AddressModel *addressModel;

@end

@implementation LocationPlist

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeHereCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"homeCell"];
    [self.locationName setTitle:self.location forState:UIControlStateNormal];
    [self beginLoadNewData];
//    设置右侧索引字体颜色
    self.tableView.sectionIndexColor = [UIColor redColor];
}


- (IBAction)closeClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return @"   定位";
    }else if (section==1)
    {
       return @"    热门";
    }
    DataModel_address *data =self.addressModel.data;
    NSArray *array =  [data indexOfAll];
    NSArray *subArray =array[section-2];
    if (subArray.count>0) {
        ListModel_address *list =subArray[0];
        return list.alpha_index;
    }
    return @"";
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    DataModel_address *data =self.addressModel.data;
   NSArray *array =  [data indexOfAll];
    return array.count+2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0||section==1) {
        return 1;
    }
    DataModel_address *data =self.addressModel.data;
    NSArray *array =  [data indexOfAll];
    NSArray *subArray =array[section-2];
    return subArray.count;

    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0) {
        HomeHereCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homeCell"forIndexPath:indexPath];
        cell.homeString = self.locationName.titleLabel.text;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.section==1) {
//        HotsLocationCell *cell = [HotsLocationCell createHotsLocationCell:tableView andCount:self.addressModel.data.hots.count];
        HotsLocationCell *cell = [HotsLocationCell createHotsLocationCell:tableView andData:self.addressModel.data];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [UITableViewCell new];
    }
    DataModel_address *data =self.addressModel.data;
    NSArray *array =  [data indexOfAll];
    NSArray *subArray =array[indexPath.section-2];
    
    ListModel_address *list =subArray[indexPath.row];
    cell.textLabel.text = list.name;
//    cell.backgroundColor =randomColor;
    return cell;
}

//显示每组标题索引
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return @[@"定位",@"热门",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
}

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return index;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==1) {
        return  [self.addressModel.data hotsRowHeight];
    }
    return 44;
}

-(void)beginLoadNewData
{
    [SVProgressHUD showWithStatus:@"正在加载"];
    [self dispatchGetData];

}


-(void)dispatchGetData
{
    NSString *stringURL = @"http://nahaowan.com/api/v3/city/list";
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [WebUtile requesHttpData:stringURL andSome:dic andReCallData:^(id obj) {
        self.addressModel =[AddressModel yy_modelWithJSON:obj];
        [SVProgressHUD dismiss];
        [self.tableView reloadData];
    }];
    
}
@end
