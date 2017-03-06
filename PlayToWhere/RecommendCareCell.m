//
//  RecommendCareCell.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/28.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "RecommendCareCell.h"

@interface RecommendCareCell ()
@property (weak, nonatomic) IBOutlet CircleButton *userImageBtn;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userAddress;
@property (weak, nonatomic) IBOutlet UILabel *userLocation;

@end


@implementation RecommendCareCell

+(instancetype)createRecommendCareCell:(UITableView *)tableView
{
    RecommendCareCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RecommendCareCell"];
    if (cell ==nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"RecommendCareCell" owner:nil options:nil].firstObject;
    }
    return cell;
}

-(void)setList:(Care_list *)list
{
    _list = list;
    [self.userImageBtn setBackgroundImageForState:UIControlStateNormal withURL:[NSURL URLWithString:list.user.headimg] placeholderImage:defaultPhoto];
    self.userName.text = list.user.username;
    self.userAddress.text = list.recommend_reason;
    self.userLocation.text = list.user.location;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)careClicked:(id)sender {
}
- (IBAction)userBtnClicked:(id)sender {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
