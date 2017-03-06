//
//  HotsLocationCell.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/3/3.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressModel.h"
@interface HotsLocationCell : UITableViewCell
+(instancetype)createHotsLocationCell:(UITableView *)tableView andData:(DataModel_address*)dataModel;
@end
