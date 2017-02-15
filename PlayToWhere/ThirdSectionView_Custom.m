//
//  ThirdSectionView_Custom.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/10.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "ThirdSectionView_Custom.h"
#import "listSection.h"
@interface ThirdSectionView_Custom()
@property(nonatomic,strong)CustomCellWithAcessoryImage *cell ;
@end
@implementation ThirdSectionView_Custom


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 50, 30)];
        title.text = @"话题";
        title.font = kFont(12);
        title.textColor = [UIColor redColor];
        
        UILabel *note = [[UILabel alloc]initWithFrame:CGRectMake(70, 0, 100, 30)];
        note.text = @"我的话题 ";
        note.font = kFont(12);
        note.textColor = [UIColor grayColor];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(SCREEN_WIDTH-80, 0, 50, 30);
        [btn setTitle:@"更多" forState:UIControlStateNormal];
        btn.titleLabel.font = kFont(12);
        [btn addTarget:self action:@selector(moreBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];

        
        UITableView *tableVIew = [[UITableView alloc]initWithFrame:CGRectMake(0, 30, SCREEN_WIDTH, frame.size.height-30) style:(UITableViewStyleGrouped)];
        tableVIew.scrollEnabled = NO;
        tableVIew.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self addSubview:title];
        [self addSubview:note];
        [self addSubview:btn];
        [self addSubview:tableVIew];
        self.userInteractionEnabled = YES;
        tableVIew.delegate = self;
        tableVIew.dataSource = self;
    }
    return self;
}

-(void)moreBtnClicked:(UIButton * )sender
{
    [self.delegate clickMoreButton];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        listSection*lists =[[listSection alloc]init];
        [lists setValuesForKeysWithDictionary:self.lists[indexPath.row]];
        User *user =[[User alloc]init];
        [user setValuesForKeysWithDictionary:(NSDictionary*)lists.user];
        Topic *topic = [Topic new];
        [topic setValuesForKeysWithDictionary:(NSDictionary*)lists.topic];
    
        CustomCellWithAcessoryImage *cell = [CustomCellWithAcessoryImage initWithCustomWithAccessoryView: lists.icon_url andTitle: lists.title andDetail:[NSString stringWithFormat:@"%ld条内容" ,(long)topic.total] andAccessoryImageName:user.headimg];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCellWithAcessoryImage *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *title = cell.textLabel.text;
    [self.delegate didSelectCellForRowIndex:tableView andIndexPath:indexPath andTitle:title];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
