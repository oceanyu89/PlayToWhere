//
//  ZeroSectionCell.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/28.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "ZeroSectionCell.h"

@interface ZeroSectionCell ()
//@property(nonatomic,strong)UIButton *attentionBtn;
@end

@implementation ZeroSectionCell

+(instancetype)createZeroSectionCell:(UITableView *)tableView
{
    ZeroSectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zeroCell"];
    if (cell ==nil) {
        cell = [[ZeroSectionCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"zeroCell"];
        UIButton *attentionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        attentionBtn.frame = CGRectMake(SCREEN_WIDTH-100, 30, 50, 30);
        [attentionBtn setImage:[UIImage imageNamed:@"add-question_14x14_"] forState:UIControlStateNormal];
        [attentionBtn setTitle:@"关注" forState:UIControlStateNormal];
        attentionBtn.layer.cornerRadius = 6*SCREEN_WIDTH_RATIO;
        attentionBtn.layer.borderColor = [UIColor redColor].CGColor;
        attentionBtn.layer.borderWidth =1;
        attentionBtn.layer.masksToBounds = YES;
        attentionBtn.titleLabel.font = kFont(12);
        [attentionBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        cell.accessoryView = attentionBtn;
    }
    return cell;
}
-(void)setList:(Care_list *)list
{
    _list = list;
    self.detailTextLabel.text =list.recommend_reason;
    self.detailTextLabel.font = kFont(10);
    self.detailTextLabel.textColor = [UIColor lightGrayColor];
    [self.imageView setImageWithURL:[NSURL URLWithString:list.user.headimg] placeholderImage:defaultPhoto];
    self.imageView.layer.cornerRadius = self.imageView.width*0.5;
    self.imageView.layer.masksToBounds = YES;
    self.textLabel.text = list.user.username;
    self.textLabel.font = kFont(12);
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
