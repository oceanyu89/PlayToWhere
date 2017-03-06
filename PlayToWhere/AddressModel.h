//
//  AddressModel.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/3/3.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DataModel_address;
@class HotsModel_address;
@class ParentsModel_address;
@class ListModel_address;

@interface AddressModel : NSObject
@property (nonatomic,assign) NSInteger ret;
@property (nonatomic,copy) NSString *msg;
@property(nonatomic,strong)DataModel_address *data;
@end
/**DataModel_address*/
@interface DataModel_address : NSObject
@property(nonatomic,strong)NSArray *hots;
@property(nonatomic,strong)NSArray *parents;
@property(nonatomic,strong)NSArray *list;
-(float)hotsRowHeight;
-(NSArray *)indexOfAll;
@property(nonatomic,strong)NSMutableDictionary *dic;

@end
/**hotsModel_address*/
@interface HotsModel_address : NSObject
@property (nonatomic,copy) NSString* name;
@property (nonatomic,assign) CGFloat lat;
@property (nonatomic,assign) CGFloat lng;


@end

/**ParentsModel_address*/
@interface ParentsModel_address : NSObject
@property (nonatomic,copy) NSString* name;
@property (nonatomic,assign) CGFloat lat;
@property (nonatomic,assign) CGFloat lng;
@end

/**ListModel_address*/
@interface ListModel_address : NSObject
@property (nonatomic,copy) NSString* name;
@property (nonatomic,assign) CGFloat lat;
@property (nonatomic,assign) CGFloat lng;
@property (nonatomic,copy) NSString* alpha_index;
@property (nonatomic,copy) NSString* parent;

@end

