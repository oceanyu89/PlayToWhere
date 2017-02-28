//
//  SecondVC.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/22.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "SecondVC.h"
#import "detail_request.h"
#import "SharedCell.h"
#import "CustomLayout.h"
@interface SecondVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,CustomLayoutDelegate>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)detail_request *request_model;
@property(nonatomic,strong)NSMutableArray *mulArray;
@end

@implementation SecondVC
-(UICollectionView *)collectionView
{
    if (_collectionView ==nil) {
        CustomLayout *layout = [[CustomLayout alloc]init];
        layout.delegate = self;

        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:layout];
        //
        _collectionView.backgroundColor = [UIColor colorWith255Red:246 green:246 blue:246 alpha:255];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
//        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
        [_collectionView registerNib:[UINib nibWithNibName:@"SharedCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"collectionCell"];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
   return   self.request_model.data.list.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SharedCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    cell.list = self.request_model.data.list[indexPath.item];
//    cell.backgroundColor = randomColor;
    return cell;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self collectionView];
    [self progressHUDGetData];
}
-(void)progressHUDGetData
{
    [SVProgressHUD showWithStatus:@"正在加载"];
    [self getHttpData];
}

-(void)getHttpData
{
    NSString *stringURL = @"http://nahaowan.com/api/v2/haowan/list?collection_id=438&list=collection&location=&offset=0&section=%E5%88%86%E4%BA%AB";
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [WebUtile requesHttpData:stringURL andSome:dic andReCallData:^(id obj) {
        self.request_model =[detail_request yy_modelWithJSON:obj];
        [self.collectionView reloadData];
        [SVProgressHUD dismiss];
    }];
    
}
-(CGFloat)waterFlowLayout:(UICollectionViewLayout *)waterFlowLayout heightForRowAtIndex:(NSInteger)index itemWidth:(CGFloat)width
{
    detail_list *list =self.request_model.data.list[index];
    detail_photos *photos = list.photos[0];
    CGFloat photoHeight = photos.image.height*(width/photos.image.width);
    return    photoHeight+90;
}



@end
