//
//  FirstSectionNavigationController.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/8.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "FirstSectionNavigationController.h"
#import "LocationForThere.h"
#import <CoreLocation/CoreLocation.h>
#import "LocationPlist.h"
@interface FirstSectionNavigationController ()<CLLocationManagerDelegate>
@property(nonatomic,strong)CustomButton_leftTitleRightImage *btn;
@property(nonatomic,strong)CLLocationManager *locationManager ;
@end

@implementation FirstSectionNavigationController

-(instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
    
        //设置右按钮
        rootViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"wishlist_24x24_"] style:(UIBarButtonItemStyleDone) target:self action:@selector(rightClicked:)];
        [rootViewController.navigationItem.rightBarButtonItem setTintColor:[UIColor whiteColor]];
        
        //设置左按钮
        self.btn = [CustomButton_leftTitleRightImage buttonWithType:UIButtonTypeCustom];
        self.btn.frame = CGRectMake(0, 0, 60, 40);
        [self.btn setTitle:@"深圳" forState:UIControlStateNormal];
        self.btn.titleLabel.font = kFont(15);
        [self.btn addTarget:self action:@selector(leftClicked:) forControlEvents:UIControlEventTouchUpInside];
        //对button内的图片底色进行渲染
        [self.btn setImage:[[UIImage imageNamed:@"pick-list-arrow-down"] imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)] forState:UIControlStateNormal];
        [self.btn setTintColor:[UIColor whiteColor]];
        UIBarButtonItem *leftbar = [[UIBarButtonItem alloc]initWithCustomView:self.btn];
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
    LocationPlist *locationVC = [LocationPlist new];
    locationVC.location = self.btn.titleLabel.text;
    [self presentViewController:locationVC animated:YES completion:nil];
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
    
    self.navigationItem.backBarButtonItem =   [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"navigation-back"]imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate) ] style:(UIBarButtonItemStyleDone) target:self action:@selector(leftBarBtnClicked:)];
    self.navigationItem.backBarButtonItem.title = @"";
    self.navigationBar.tintColor = [UIColor grayColor];

}
-(void)leftBarBtnClicked:(UIBarButtonItem *)sender
{
    [self popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 是否打开定位服务
        if ([CLLocationManager locationServicesEnabled]) {
            NSLog(@"开启定位服务");
        } else {
            NSLog(@"没有开启定位服务");
        }
        // 创建manager
        self.locationManager = [[CLLocationManager alloc] init];
        // 设置代理
        self.locationManager.delegate = self;
        
        if ([[UIDevice currentDevice].systemVersion floatValue] > 8.0) {
            // 如果程序定位设置不是 使用应用程序期间，则设置为 使用应用程序期间
            if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedWhenInUse) {
                [self.locationManager requestWhenInUseAuthorization];
            }
        }
        // 设置精确度，精度越高越耗电！
        [self.locationManager setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
        [self.locationManager startUpdatingLocation];
    

}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    // 1.获取用户位置的对象
    CLLocation *location = [locations lastObject];
    CLLocationCoordinate2D coordinate = location.coordinate;
    NSLog(@"纬度:%f 经度:%f", coordinate.latitude, coordinate.longitude);
    //位置反编码(根据当前的经纬度获取具体的位置信息)
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        
        for (CLPlacemark *placeMark in placemarks) {
            NSLog(@"位置:%@", placeMark.name);
            NSLog(@"街道:%@", placeMark.thoroughfare);
            NSLog(@"子街道:%@", placeMark.subThoroughfare);
            NSLog(@"市:%@", placeMark.locality);
            NSLog(@"区\\县:%@", placeMark.subLocality);
            NSLog(@"行政区:%@", placeMark.administrativeArea);
            NSLog(@"国家:%@", placeMark.country);
//            [self.btn setTitle:placeMark.locality forState:UIControlStateNormal];
            self.btn.titleLabel.text =placeMark.locality;
            self.btn.titleLabel.font = kFont(13);
        }
    }];
    // 2.停止定位
    [manager stopUpdatingLocation];
}

@end
