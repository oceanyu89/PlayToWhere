//
//  FirstCellForAllSecondSection.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/21.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "FirstCellForAllSecondSection.h"
@interface FirstCellForAllSecondSection()
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;

@end

@implementation FirstCellForAllSecondSection

+(FirstCellForAllSecondSection*)getCustomCellAtFirst
{
    
    FirstCellForAllSecondSection *cell = [[NSBundle mainBundle]loadNibNamed:@"FirstCellForAllSecondSection" owner:nil options:nil].firstObject;
    return cell;
}
-(void)setList:(detail_list *)list
{
    _list = list;
    self.userImageView.layer.cornerRadius = self.userImageView.bounds.size.width*0.5;
    self.userImageView.clipsToBounds = YES;
    
    self.nameLabel.text = list.user.username;
    [self.userImageView setImageWithURL:[NSURL URLWithString:list.user.headimg] placeholderImage:defaultPhoto];
    [self.addressName setTitle :list.location forState:UIControlStateNormal];
    NSDateFormatter *df = [NSDateFormatter new];
    df.dateFormat = @"MM月dd日";
    self.dateLabel.text = [df stringFromDate:list.ctime];
    
}
- (IBAction)addressBtn:(UIButton *)sender {
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
