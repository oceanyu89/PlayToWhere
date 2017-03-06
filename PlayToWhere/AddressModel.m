//
//  AddressModel.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/3/3.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "AddressModel.h"

@implementation AddressModel

@end
@implementation DataModel_address
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"hots" : [HotsModel_address class],
                   @"parents" : [ParentsModel_address class],
             @"list" : [ListModel_address class]};
}

-(float)hotsRowHeight
{
    if (self.hots.count<=3) {
        return 44;
    }else if (self.hots.count<=6 && self.hots.count>3)
    {
        return 44*2;
    }else if (self.hots.count<=9 && self.hots.count>6)
    {
        return 44*3;
    }else if (self.hots.count<=12 && self.hots.count>9)
    {
        return 44*4;
    }else 
    {
        return 44*5;
    }
    
}

-(NSArray *)indexOfAll
{
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    NSMutableArray *aArray = [NSMutableArray array];
    NSMutableArray *bArray = [NSMutableArray array];
    NSMutableArray *cArray = [NSMutableArray array];
    NSMutableArray *dArray = [NSMutableArray array];
    NSMutableArray *eArray = [NSMutableArray array];
    NSMutableArray *fArray = [NSMutableArray array];
    NSMutableArray *gArray = [NSMutableArray array];
    NSMutableArray *hArray = [NSMutableArray array];
    NSMutableArray *iArray = [NSMutableArray array];
    NSMutableArray *jArray = [NSMutableArray array];
    NSMutableArray *kArray = [NSMutableArray array];
    NSMutableArray *lArray = [NSMutableArray array];
    NSMutableArray *mArray = [NSMutableArray array];
    NSMutableArray *nArray = [NSMutableArray array];
    NSMutableArray *oArray = [NSMutableArray array];
    NSMutableArray *pArray = [NSMutableArray array];
    NSMutableArray *qArray = [NSMutableArray array];
    NSMutableArray *rArray = [NSMutableArray array];
    NSMutableArray *sArray = [NSMutableArray array];
    NSMutableArray *tArray = [NSMutableArray array];
    NSMutableArray *uArray = [NSMutableArray array];
    NSMutableArray *vArray = [NSMutableArray array];
    NSMutableArray *wArray = [NSMutableArray array];
    NSMutableArray *xArray = [NSMutableArray array];
    NSMutableArray *yArray = [NSMutableArray array];
    NSMutableArray *zArray = [NSMutableArray array];
    for (int i =0; i<self.list.count; i++) {
        ListModel_address *list = self.list[i];
        if ([list.alpha_index isEqualToString:@"A"]) {
            [aArray addObject:list];
        }
        if ([list.alpha_index isEqualToString:@"B"]) {
            [bArray addObject:list];
        }
        if ([list.alpha_index isEqualToString:@"C"]) {
            [cArray addObject:list];
        }
        if ([list.alpha_index isEqualToString:@"D"]) {
            [dArray addObject:list];
        }
        if ([list.alpha_index isEqualToString:@"E"]) {
            [eArray addObject:list];
        }
        if ([list.alpha_index isEqualToString:@"F"]) {
            [fArray addObject:list];
        }
        if ([list.alpha_index isEqualToString:@"G"]) {
            [gArray addObject:list];
        }
        if ([list.alpha_index isEqualToString:@"H"]) {
            [hArray addObject:list];
        }
        if ([list.alpha_index isEqualToString:@"I"]) {
            [iArray addObject:list];
        }
        if ([list.alpha_index isEqualToString:@"J"]) {
            [jArray addObject:list];
        }
        if ([list.alpha_index isEqualToString:@"K"]) {
            [kArray addObject:list];
        }
        if ([list.alpha_index isEqualToString:@"L"]) {
            [lArray addObject:list];
        }
        if ([list.alpha_index isEqualToString:@"M"]) {
            [mArray addObject:list];
        }
        if ([list.alpha_index isEqualToString:@"N"]) {
            [nArray addObject:list];
        }
        if ([list.alpha_index isEqualToString:@"O"]) {
            [oArray addObject:list];
        }
        if ([list.alpha_index isEqualToString:@"P"]) {
            [pArray addObject:list];
        }
        if ([list.alpha_index isEqualToString:@"Q"]) {
            [qArray addObject:list];
        }
        if ([list.alpha_index isEqualToString:@"R"]) {
            [rArray addObject:list];
        }
        if ([list.alpha_index isEqualToString:@"S"]) {
            [sArray addObject:list];
        }
        if ([list.alpha_index isEqualToString:@"T"]) {
            [tArray addObject:list];
        }
        if ([list.alpha_index isEqualToString:@"U"]) {
            [uArray addObject:list];
        }
        if ([list.alpha_index isEqualToString:@"V"]) {
            [vArray addObject:list];
        }
        if ([list.alpha_index isEqualToString:@"W"]) {
            [wArray addObject:list];
        }
        if ([list.alpha_index isEqualToString:@"X"]) {
            [xArray addObject:list];
        }
        if ([list.alpha_index isEqualToString:@"Y"]) {
            [yArray addObject:list];
        }
        if ([list.alpha_index isEqualToString:@"Z"]) {
            [zArray addObject:list];
        }

    }

    
    return @[aArray,bArray,cArray,dArray,eArray,fArray,gArray,hArray,iArray,jArray,kArray,lArray,mArray,nArray,oArray,pArray,qArray,rArray,sArray,tArray,uArray,vArray,wArray,xArray,yArray,zArray];
}

@end

@implementation HotsModel_address

@end


@implementation ParentsModel_address

@end
@implementation ListModel_address


@end


