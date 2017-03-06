//
//  LocationForThere.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/3/1.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "LocationForThere.h"


@interface LocationForThere ()<CLLocationManagerDelegate>
/*
//（1）每隔多少米定位一次
@property(assign, nonatomic) CLLocationDistance distanceFilter;
//（2）定位的精确度
@property(assign, nonatomic) CLLocationAccuracy desiredAccuracy;
//（3）定位信息
@property(readonly, nonatomic, copy) CLLocation *location;
//（4）开始定位与关闭定位
- (void)startUpdatingLocation;
- (void)stopUpdatingLocation;
//CLLocation类是用来表示某一位置的经纬度，常用属性有和方法：
//(1)经纬度
@property(readonly, nonatomic) CLLocationCoordinate2D coordinate;
//（2）海波高度
@property(readonly, nonatomic) CLLocationDistance altitude;
//（3）路线，航向 （范围在 0.0°~359.9°，0° 是正北 方向）
@property(readonly, nonatomic) CLLocationDirection course;
//（4）行走速度
@property(readonly, nonatomic) CLLocationSpeed speed;
//（5）计算两个位置之间的距离
- (CLLocationDistance)distanceFromLocation:(const CLLocation *)location;
*/

@property(nonatomic,strong)CLLocationManager *locationManager;

@end

@implementation LocationForThere



-(void)getLocationOfNowThere
{
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
        /*
         kCLAuthorizationStatusNotDetermined = 0,   // 用户还没决定 要不要授权
         kCLAuthorizationStatusRestricted,          // 应用程序受限制，没有授权
         kCLAuthorizationStatusDenied,              // 被用户拒绝授权
         kCLAuthorizationStatusAuthorizedAlways,    // 始终
         kCLAuthorizationStatusAuthorizedWhenInUse  // 使用应用程序期间
         */
        
        // 如果程序定位设置不是 使用应用程序期间，则设置为 使用应用程序期间
        if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedWhenInUse) {
            [self.locationManager requestWhenInUseAuthorization];
        }
    }
    
    // 设置精确度，精度越高越耗电！
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
    [self.locationManager startUpdatingLocation];
    
    // 定位频率，每隔10米定位一次
//    CLLocationDistance distance = 10.0;
//    self.locationManager.distanceFilter = distance;

}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
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
                self.locationBlock(placeMark.locality);
        }
    }];


    // 2.停止定位
    [manager stopUpdatingLocation];
}

-(void)getNowLocation:(LocationBlock)locationBlock
{
    self.locationBlock = locationBlock;
}

/*
 -(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
 {
 // locations数组里边存放的是CLLocation对象，一个CLLocation对象就代表着一个位置
 for (CLLocation *newLocation in locations) {
 //拿到经纬度
 CLLocationCoordinate2D coor2D = newLocation.coordinate;
 NSLog(@"纬度为:%f, 经度为:%f", coor2D.latitude, coor2D.longitude);
 
 //海拔高度
 CLLocationDistance altitude = newLocation.altitude;
 NSLog(@"高度为:%f", altitude);
 
 //水平精确度, 垂直精确度
 CLLocationAccuracy horizontalAcc = newLocation.horizontalAccuracy;
 CLLocationAccuracy verticalAcc = newLocation.verticalAccuracy;
 NSLog(@"%f, %f", horizontalAcc, verticalAcc);
 
 //北京站 经纬度
 //        CLLocation *anyLocation = [[CLLocation alloc] initWithLatitude:39.909843 longitude:116.433015];
 //        CLLocationDistance distance = [newLocation distanceFromLocation:anyLocation];
 //        NSLog(@"当前位置到北京站的距离为:%f米", distance);
 
 
 //位置反编码(根据当前的经纬度获取具体的位置信息)
 CLGeocoder *geocoder = [[CLGeocoder alloc] init];
 [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
 
 for (CLPlacemark *placeMark in placemarks) {
 NSLog(@"位置:%@", placeMark.name);
 NSLog(@"街道:%@", placeMark.thoroughfare);
 NSLog(@"子街道:%@", placeMark.subThoroughfare);
 NSLog(@"市:%@", placeMark.locality);
 NSLog(@"区\\县:%@", placeMark.subLocality);
 NSLog(@"行政区:%@", placeMark.administrativeArea);
 NSLog(@"国家:%@", placeMark.country);
 }
 }];
 
 //停止定位,定位是一个很耗能的功能，在不需要时应当停止定位
 [manager stopUpdatingLocation];
 }
 }
 */


@end
