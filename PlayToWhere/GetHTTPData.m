//
//  GetHTTPData.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/14.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "GetHTTPData.h"

@implementation GetHTTPData
#pragma mark - 创建请求者
+(AFHTTPSessionManager *)manager
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 超时时间
    manager.requestSerializer.timeoutInterval = kTimeOutInterval;
    
    // 声明上传的是json格式的参数，需要你和后台约定好，不然会出现后台无法获取到你上传的参数问题
    manager.requestSerializer = [AFHTTPRequestSerializer serializer]; // 上传普通格式
    //    manager.requestSerializer = [AFJSONRequestSerializer serializer]; // 上传JSON格式
    
    // 声明获取到的数据格式
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer]; // AFN不会解析,数据是data，需要自己解析
    
        manager.responseSerializer = [AFJSONResponseSerializer serializer]; // AFN会JSON解析返回的数据
    // 个人建议还是自己解析的比较好，有时接口返回的数据不合格会报3840错误，大致是AFN无法解析返回来的数据
    return manager;
}

+ (void)getUserCarShopAndSalesDataForSalesWithUserId:(NSString *)first date:(NSString *)second selectAreaType:(NSString *)third andGet:(NSString *)getString andTag:(NSInteger)tag
{
    // get请求也可以直接将参数放在字典里，AFN会自己讲参数拼接在url的后面，不需要自己凭借
    
    NSDictionary *param = @{@"user_id":first, @"sale_date":second, @"accessToken":@"e9c0e60318ebd07ec2fe", @"area_type":third};
    // 创建请求类
    AFHTTPSessionManager *manager = [self manager];
    [manager GET:@"http://pm.yunhan-china.com/index.php/Api_sale/sales_get" parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
        // 这里可以获取到目前数据请求的进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求成功
        if(responseObject){
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//            success(dict,YES);
        } else {
//            success(@{@"msg":@"暂无数据"}, NO);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 请求失败
//        fail(error);
    }];
}

//success:(SuccessBlock)success fail:(AFNErrorBlock)fail

+ (void)loginWithUserAccount:(NSString *)account password:(NSString *)password {
    // 将请求参数放在请求的字典里
    NSDictionary *param = @{@"phoneNumber":account, @"password":@"f379eaf3c831b04de153469d1bec345e"};
    // 创建请求类
    AFHTTPSessionManager *manager = [self manager];
    [manager POST:@"http://pm.yunhan-china.com/index.php/api_common/login"
       parameters:param
         progress:^(NSProgress * _Nonnull uploadProgress) {
             // 这里可以获取到目前数据请求的进度
         } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             // 请求成功
             if(responseObject){
                 NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//                 success(dict,YES);
             } else {
//                 success(@{@"msg":@"暂无数据"}, NO);
             }
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             // 请求失败
//             fail(error);
         }];
    
}
//********************************************************************************************************************************
- (void)downLoadWithUrlString:(NSString *)urlString
{
    // 1.创建管理者对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 2.设置请求的URL地址
    NSURL *url = [NSURL URLWithString:urlString];
    // 3.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // 4.下载任务
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        // 下载进度
        NSLog(@"当前下载进度为:%lf", 1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        // 下载地址
        NSLog(@"默认下载地址%@",targetPath);
        // 设置下载路径,通过沙盒获取缓存地址,最后返回NSURL对象
        NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
        return [NSURL fileURLWithPath:filePath]; // 返回的是文件存放在本地沙盒的地址
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        // 下载完成调用的方法
        NSLog(@"%@---%@", response, filePath);
    }];
    // 5.启动下载任务
    [task resume];
}

- (void)uploadWithUser:(NSString *)userId UrlString:(NSString *)urlString upImg:(UIImage *)upImg
{
    // 创建管理者对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 参数
    NSDictionary *param = @{@"user_id":userId};
    [manager POST:urlString parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        /******** 1.上传已经获取到的img *******/
        // 把图片转换成data
        NSData *data = UIImagePNGRepresentation(upImg);
        // 拼接数据到请求题中
        [formData appendPartWithFileData:data name:@"file" fileName:@"123.png" mimeType:@"image/png"];
        /******** 2.通过路径上传沙盒或系统相册里的图片 *****/
        //        [formData appendPartWithFileURL:[NSURL fileURLWithPath:@"文件地址"] name:@"file" fileName:@"1234.png" mimeType:@"application/octet-stream" error:nil];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        // 打印上传进度
        NSLog(@"%lf",1.0 *uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //请求成功
        NSLog(@"请求成功：%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //请求失败
        NSLog(@"请求失败：%@",error);
    }];
}

- (void)AFNetworkStatus{
    
    //1.创建网络监测者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    /*枚举里面四个状态  分别对应 未知 无网络 数据 WiFi
     typedef NS_ENUM(NSInteger, AFNetworkReachabilityStatus) {
     AFNetworkReachabilityStatusUnknown          = -1,      未知
     AFNetworkReachabilityStatusNotReachable     = 0,       无网络
     AFNetworkReachabilityStatusReachableViaWWAN = 1,       蜂窝数据网络
     AFNetworkReachabilityStatusReachableViaWiFi = 2,       WiFi
     };
     */
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //这里是监测到网络改变的block  可以写成switch方便
        //在里面可以随便写事件
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知网络状态");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"无网络");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"蜂窝数据网");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WiFi网络");
                
                break;
                
            default:
                break;
        }
        
    }] ;  
}

//*********************************************************
+ (void)getHTTPData:(NSString *)getString andTag:(NSInteger)tag andNSObject:(id)object
{
    // get请求也可以直接将参数放在字典里，AFN会自己讲参数拼接在url的后面，不需要自己凭借
    
//    NSDictionary *param = @{@"user_id":first, @"sale_date":second, @"accessToken":@"e9c0e60318ebd07ec2fe", @"area_type":third};
    NSDictionary *param =[[NSDictionary alloc]init];
    // 创建请求类
    AFHTTPSessionManager *manager = [self manager];
    [manager GET:getString parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
        // 这里可以获取到目前数据请求的进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求成功
        if(responseObject){
//            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            [self sucess:responseObject andNSObjcet:object];
        } else {
        
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 请求失败

    }];
}

+(id)sucess:(id)responseObject andNSObjcet:(id)object
{
    if ([object isKindOfClass:[SectionTwoToInteresting class]]) {
        return  [SectionTwoToInteresting yy_modelWithJSON:responseObject];
    }
    else if ([object isKindOfClass:[LastSection_model class]]) {
        return  [LastSection_model yy_modelWithJSON:responseObject];
    }
    return nil;
}

/*
 #pragma mark -网络请求数据
 -(void)getURLData:(NSString *)url andSeciton:(NSInteger)section
 {
 NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
 AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
 NSURL *URL =nil;
 switch (section) {
 case 1:
 URL = [NSURL URLWithString:@"http://nahaowan.com/api/v1/collection/list?list=explore&location=%E6%B7%B1%E5%9C%B3&offset=0"];
 break;
 case 2:
 URL = [NSURL URLWithString:@"http://nahaowan.com/api/v1/group/list?list=hot&location=%E6%B7%B1%E5%9C%B3"];
 break;
 case 3:
 URL = [NSURL URLWithString:@"http://nahaowan.com/api/v2/haowan/list/ad?geo=22.6481848889781%2C114.210079510808&location=%E6%B7%B1%E5%9C%B3"];
 break;
 }
 NSURLRequest *request = [NSURLRequest requestWithURL:URL];
 NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
 if (error) {
 NSLog(@"Error: %@", error);
 } else {
 switch (section) {
 case 1:
 self.model1  = [SectionTwoToInteresting yy_modelWithJSON:responseObject];
 [self.tableView reloadData];
 [self.tableView.mj_header endRefreshing];
 break;
 case 2:
 self.model2  = [SectionTwoToInteresting yy_modelWithJSON:responseObject];
 [self.tableView reloadData];
 
 break;
 case 3:
 self.model3  = [LastSection_model yy_modelWithJSON:responseObject];
 [self.tableView reloadData];
 
 break;
 }
 
 }
 }];
 [dataTask resume];
 
 
 }

 */
@end
