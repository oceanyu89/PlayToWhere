//
//  VCCopyFromNV.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/14.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCCopyFromNV : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIView *myView;
@property(nonatomic,strong)UIButton *backBtn;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UITableView *tableView;
//@property (nonatomic,copy) NSString *title;
@end
