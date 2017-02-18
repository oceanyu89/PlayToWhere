//
//  CustomLaoutCell.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/15.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "CustomLaoutCell.h"

@implementation CustomLaoutCell
+(instancetype)getCustomLayoutCell:(UITableView*)tableView andIndexPath:(NSIndexPath *)indexPath
{
    CustomLaoutCell *cell = [[NSBundle mainBundle]loadNibNamed:@"CustomLaoutCell" owner:nil options:nil].firstObject;
    return cell;
}
-(void)setImageOfIV:(UIImageView *)iv andIndex:(NSInteger)i andTopic:(NewTopic*)topic
{
    Images *images = [Images new];
    [images setValuesForKeysWithDictionary:topic.images[i]];

    
    [iv setImageWithURL:[NSURL URLWithString:images.url] placeholderImage:[UIImage imageNamed:@"default_user_head"]];
}

-(void)setTopic:(NewTopic *)topic
{
    User *user = [User new];
    [user setValuesForKeysWithDictionary:(NSDictionary*)topic.user];
    self.userName.text = user.username;
    self.userImageView.image = [UIImage imageNamed:@"default_user_head"];

    [self.userImageView setImageWithURL:[NSURL URLWithString:user.headimg] placeholderImage:[UIImage imageNamed:@"default_user_head"]];
    self.userImageView.layer.cornerRadius = self.userImageView.bounds.size.width*0.5;
    self.userImageView.layer.masksToBounds = YES;
    self.userDate.text = topic.ctime;
    self.contentLabel.text = topic.content;
    [self createImageWithLayout:topic];

}


-(void)createImageWithLayout:(NewTopic *)topic
{
    CGFloat w =(SCREEN_WIDTH-40)/3;
    if (topic.images.count>0) {
        //         CGRect rect = self.MyViewForAddImageView.bounds;
        switch (topic.images.count) {
            case 1:
            {
                UIImageView *iv = [[UIImageView alloc]init];
                [self setImageOfIV:iv andIndex:0 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv];
                [iv mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.MyViewForAddImageView).offset(10);
                    make.left.equalTo(self.MyViewForAddImageView).offset(10);
                    make.width.mas_equalTo(w);
                    make.height.mas_equalTo(w);
                    make.bottom.equalTo(_MyViewForAddImageView).offset(-10);
                }];
            }
                break;
            case 2:
            {
                UIImageView *iv = [[UIImageView alloc]init];
                [self setImageOfIV:iv andIndex:0 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv];
                UIImageView *iv2 = [[UIImageView alloc]init];
                [self setImageOfIV:iv2 andIndex:1 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv2];
                
                [iv mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.MyViewForAddImageView).offset(10);
                    make.left.equalTo(self.MyViewForAddImageView).offset(10);
                    make.right.equalTo(iv2.mas_left).offset(-10);
                    make.width.mas_equalTo(w);
                    make.height.mas_equalTo(w);
                    make.bottom.equalTo(_MyViewForAddImageView).offset(-10);
                }];
                [iv2 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.MyViewForAddImageView).offset(10);
                    make.width.mas_equalTo(w);
                    make.height.mas_equalTo(w);
                    make.bottom.equalTo(_MyViewForAddImageView).offset(-10);
                }];
                
            }
                break;
            case 3:
            {
                UIImageView *iv = [[UIImageView alloc]init];
                [self setImageOfIV:iv andIndex:0 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv];
                
                UIImageView *iv2 = [[UIImageView alloc]init];
                [self setImageOfIV:iv2 andIndex:1 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv2];
                
                UIImageView *iv3 = [[UIImageView alloc]init];
                [self setImageOfIV:iv3 andIndex:2 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv3];
                
                [iv mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.MyViewForAddImageView).offset(10);
                    make.left.equalTo(self.MyViewForAddImageView).offset(10);
                    make.right.equalTo(iv2.mas_left).offset(-10);
                    make.height.mas_equalTo(w);
                    make.height.equalTo(@[iv.mas_height, iv2.mas_height,iv3.mas_height]);
                    make.width.equalTo(@[iv.mas_width, iv2.mas_width,iv3.mas_width]);
                    make.bottom.equalTo(_MyViewForAddImageView).offset(-10);
                }];
                [iv2 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.MyViewForAddImageView).offset(10);
                    make.right.equalTo(iv3.mas_left).offset(-10);
                }];
                [iv3 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.MyViewForAddImageView).offset(10);
                    make.right.equalTo(self.MyViewForAddImageView).offset(-10);
                }];
                
            }
                break;
            case 4:
            {
                UIImageView *iv = [[UIImageView alloc]init];
                [self setImageOfIV:iv andIndex:0 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv];
                
                UIImageView *iv2 = [[UIImageView alloc]init];
                [self setImageOfIV:iv2 andIndex:1 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv2];
                
                UIImageView *iv3 = [[UIImageView alloc]init];
                [self setImageOfIV:iv3 andIndex:2 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv3];
                
                UIImageView *iv4 = [[UIImageView alloc]init];
                [self setImageOfIV:iv4 andIndex:3 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv4];
                
                [iv mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.MyViewForAddImageView).offset(10);
                    make.left.equalTo(self.MyViewForAddImageView).offset(10);
                    make.right.equalTo(iv2.mas_left).offset(-10);
                    make.height.mas_equalTo(w);
                    make.height.equalTo(@[iv.mas_height, iv2.mas_height,iv3.mas_height,iv4.mas_height]);
                    make.width.equalTo(@[iv.mas_width, iv2.mas_width,iv3.mas_width,iv4.mas_width]);
                    make.bottom.equalTo(iv4.mas_top).offset(-10);
                }];
                [iv2 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.MyViewForAddImageView).offset(10);
                    make.right.equalTo(iv3.mas_left).offset(-10);
                }];
                [iv3 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.MyViewForAddImageView).offset(10);
                    make.right.equalTo(self.MyViewForAddImageView).offset(-10);
                }];
                [iv4 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(self.MyViewForAddImageView).offset(10);
                    make.bottom.equalTo(_MyViewForAddImageView).offset(-10);
                }];
                
            }
                break;
            case 5:
            {
                UIImageView *iv = [[UIImageView alloc]init];
                [self setImageOfIV:iv andIndex:0 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv];
                
                UIImageView *iv2 = [[UIImageView alloc]init];
                [self setImageOfIV:iv2 andIndex:1 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv2];
                
                UIImageView *iv3 = [[UIImageView alloc]init];
                [self setImageOfIV:iv3 andIndex:2 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv3];
                
                UIImageView *iv4 = [[UIImageView alloc]init];
                [self setImageOfIV:iv4 andIndex:3 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv4];
                
                UIImageView *iv5 = [[UIImageView alloc]init];
                [self setImageOfIV:iv5 andIndex:4 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv5];
                
                [iv mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.MyViewForAddImageView).offset(10);
                    make.left.equalTo(self.MyViewForAddImageView).offset(10);
                    make.right.equalTo(iv2.mas_left).offset(-10);
                    make.height.mas_equalTo(w);
                    make.height.equalTo(@[iv.mas_height, iv2.mas_height,iv3.mas_height,iv4.mas_height,iv5.mas_height]);
                    make.width.equalTo(@[iv.mas_width, iv2.mas_width,iv3.mas_width,iv4.mas_width,iv5.mas_width]);
                    make.bottom.equalTo(iv4.mas_top).offset(-10);
                }];
                [iv2 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.MyViewForAddImageView).offset(10);
                    make.right.equalTo(iv3.mas_left).offset(-10);
                    make.bottom.equalTo(iv5.mas_top).offset(-10);
                }];
                [iv3 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.MyViewForAddImageView).offset(10);
                    make.right.equalTo(self.MyViewForAddImageView).offset(-10);
                }];
                [iv4 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(self.MyViewForAddImageView).offset(10);
                    make.right.equalTo(iv5.mas_left).offset(-10);
                    make.bottom.equalTo(_MyViewForAddImageView).offset(-10);
                }];
                [iv5 mas_makeConstraints:^(MASConstraintMaker *make) {
                    
                }];
                
            }
                break;
            case 6:
            {
                UIImageView *iv = [[UIImageView alloc]init];
                [self setImageOfIV:iv andIndex:0 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv];
                
                UIImageView *iv2 = [[UIImageView alloc]init];
                [self setImageOfIV:iv2 andIndex:1 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv2];
                
                UIImageView *iv3 = [[UIImageView alloc]init];
                [self setImageOfIV:iv3 andIndex:2 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv3];
                
                UIImageView *iv4 = [[UIImageView alloc]init];
                [self setImageOfIV:iv4 andIndex:3 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv4];
                
                UIImageView *iv5 = [[UIImageView alloc]init];
                [self setImageOfIV:iv5 andIndex:4 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv5];
                
                UIImageView *iv6 = [[UIImageView alloc]init];
                [self setImageOfIV:iv6 andIndex:5 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv6];
                
                [iv mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.MyViewForAddImageView).offset(10);
                    make.left.equalTo(self.MyViewForAddImageView).offset(10);
                    make.right.equalTo(iv2.mas_left).offset(-10);
                    make.height.mas_equalTo(w);
                    make.height.equalTo(@[iv.mas_height, iv2.mas_height,iv3.mas_height,iv4.mas_height,iv5.mas_height,iv6.mas_height]);
                    make.width.equalTo(@[iv.mas_width, iv2.mas_width,iv3.mas_width,iv4.mas_width,iv5.mas_width,iv6.mas_width]);
                    make.bottom.equalTo(iv4.mas_top).offset(-10);
                }];
                [iv2 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.MyViewForAddImageView).offset(10);
                    make.right.equalTo(iv3.mas_left).offset(-10);
                    make.bottom.equalTo(iv5.mas_top).offset(-10);
                }];
                [iv3 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.MyViewForAddImageView).offset(10);
                    make.right.equalTo(self.MyViewForAddImageView).offset(-10);
                    make.bottom.equalTo(iv6.mas_top).offset(-10);
                }];
                [iv4 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(self.MyViewForAddImageView).offset(10);
                    make.right.equalTo(iv5.mas_left).offset(-10);
                    make.bottom.equalTo(_MyViewForAddImageView).offset(-10);
                }];
                [iv5 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.equalTo(iv6.mas_left).offset(-10);
                }];
                [iv6 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.equalTo(_MyViewForAddImageView).offset(-10);
                }];
            }
                break;
            case 7:
            {
                UIImageView *iv = [[UIImageView alloc]init];
                [self setImageOfIV:iv andIndex:0 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv];
                
                UIImageView *iv2 = [[UIImageView alloc]init];
                [self setImageOfIV:iv2 andIndex:1 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv2];
                
                UIImageView *iv3 = [[UIImageView alloc]init];
                [self setImageOfIV:iv3 andIndex:2 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv3];
                
                UIImageView *iv4 = [[UIImageView alloc]init];
                [self setImageOfIV:iv4 andIndex:3 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv4];
                
                UIImageView *iv5 = [[UIImageView alloc]init];
                [self setImageOfIV:iv5 andIndex:4 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv5];
                
                UIImageView *iv6 = [[UIImageView alloc]init];
                [self setImageOfIV:iv6 andIndex:5 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv6];
                
                UIImageView *iv7 = [[UIImageView alloc]init];
                [self setImageOfIV:iv7 andIndex:6 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv7];
                
                [iv mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.MyViewForAddImageView).offset(10);
                    make.left.equalTo(self.MyViewForAddImageView).offset(10);
                    make.right.equalTo(iv2.mas_left).offset(-10);
                    make.height.mas_equalTo(w);
                    make.height.equalTo(@[iv.mas_height, iv2.mas_height,iv3.mas_height,iv4.mas_height,iv5.mas_height,iv6.mas_height,iv7.mas_height]);
                    make.width.equalTo(@[iv.mas_width, iv2.mas_width,iv3.mas_width,iv4.mas_width,iv5.mas_width,iv6.mas_width,iv7.mas_width]);
                    make.bottom.equalTo(iv4.mas_top).offset(-10);
                }];
                [iv2 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.MyViewForAddImageView).offset(10);
                    make.right.equalTo(iv3.mas_left).offset(-10);
                    make.bottom.equalTo(iv5.mas_top).offset(-10);
                }];
                [iv3 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.MyViewForAddImageView).offset(10);
                    make.right.equalTo(self.MyViewForAddImageView).offset(-10);
                    make.bottom.equalTo(iv6.mas_top).offset(-10);
                }];
                [iv4 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(self.MyViewForAddImageView).offset(10);
                    make.right.equalTo(iv5.mas_left).offset(-10);
                    make.bottom.equalTo(iv7.mas_top).offset(-10);
                }];
                [iv5 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.equalTo(iv6.mas_left).offset(-10);
                }];
                [iv6 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.equalTo(_MyViewForAddImageView).offset(-10);
                }];
                [iv7 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(_MyViewForAddImageView).offset(10);
                    make.bottom.equalTo(_MyViewForAddImageView).offset(-10);
                }];
            }
                break;
            case 8:
            {
                UIImageView *iv = [[UIImageView alloc]init];
                [self setImageOfIV:iv andIndex:0 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv];
                
                UIImageView *iv2 = [[UIImageView alloc]init];
                [self setImageOfIV:iv2 andIndex:1 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv2];
                
                UIImageView *iv3 = [[UIImageView alloc]init];
                [self setImageOfIV:iv3 andIndex:2 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv3];
                
                UIImageView *iv4 = [[UIImageView alloc]init];
                [self setImageOfIV:iv4 andIndex:3 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv4];
                
                UIImageView *iv5 = [[UIImageView alloc]init];
                [self setImageOfIV:iv5 andIndex:4 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv5];
                
                UIImageView *iv6 = [[UIImageView alloc]init];
                [self setImageOfIV:iv6 andIndex:5 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv6];
                
                UIImageView *iv7 = [[UIImageView alloc]init];
                [self setImageOfIV:iv7 andIndex:6 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv7];
                
                UIImageView *iv8 = [[UIImageView alloc]init];
                [self setImageOfIV:iv8 andIndex:7 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv8];
                
                [iv mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.MyViewForAddImageView).offset(10);
                    make.left.equalTo(self.MyViewForAddImageView).offset(10);
                    make.right.equalTo(iv2.mas_left).offset(-10);
                    make.height.mas_equalTo(w);
                    make.height.equalTo(@[iv.mas_height, iv2.mas_height,iv3.mas_height,iv4.mas_height,iv5.mas_height,iv6.mas_height,iv7.mas_height,iv8.mas_height]);
                    make.width.equalTo(@[iv.mas_width, iv2.mas_width,iv3.mas_width,iv4.mas_width,iv5.mas_width,iv6.mas_width,iv7.mas_width,iv8.mas_width]);
                    make.bottom.equalTo(iv4.mas_top).offset(-10);
                }];
                [iv2 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.MyViewForAddImageView).offset(10);
                    make.right.equalTo(iv3.mas_left).offset(-10);
                    make.bottom.equalTo(iv5.mas_top).offset(-10);
                }];
                [iv3 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.MyViewForAddImageView).offset(10);
                    make.right.equalTo(self.MyViewForAddImageView).offset(-10);
                    make.bottom.equalTo(iv6.mas_top).offset(-10);
                }];
                [iv4 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(self.MyViewForAddImageView).offset(10);
                    make.right.equalTo(iv5.mas_left).offset(-10);
                    make.bottom.equalTo(iv7.mas_top).offset(-10);
                }];
                [iv5 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.equalTo(iv6.mas_left).offset(-10);
                    make.bottom.equalTo(iv8.mas_top).offset(-10);
                }];
                [iv6 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.equalTo(_MyViewForAddImageView).offset(-10);
                }];
                [iv7 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(_MyViewForAddImageView).offset(10);
                    make.right.equalTo(iv8.mas_left).offset(-10);
                    make.bottom.equalTo(_MyViewForAddImageView).offset(-10);
                }];
                
            }
                break;
            case 9:
            {
                UIImageView *iv = [[UIImageView alloc]init];
                [self setImageOfIV:iv andIndex:0 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv];
                
                UIImageView *iv2 = [[UIImageView alloc]init];
                [self setImageOfIV:iv2 andIndex:1 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv2];
                
                UIImageView *iv3 = [[UIImageView alloc]init];
                [self setImageOfIV:iv3 andIndex:2 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv3];
                
                UIImageView *iv4 = [[UIImageView alloc]init];
                [self setImageOfIV:iv4 andIndex:3 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv4];
                
                UIImageView *iv5 = [[UIImageView alloc]init];
                [self setImageOfIV:iv5 andIndex:4 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv5];
                
                UIImageView *iv6 = [[UIImageView alloc]init];
                [self setImageOfIV:iv6 andIndex:5 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv6];
                
                UIImageView *iv7 = [[UIImageView alloc]init];
                [self setImageOfIV:iv7 andIndex:6 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv7];
                
                UIImageView *iv8 = [[UIImageView alloc]init];
                [self setImageOfIV:iv8 andIndex:7 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv8];
                
                UIImageView *iv9 = [[UIImageView alloc]init];
                [self setImageOfIV:iv9 andIndex:8 andTopic:topic];
                [self.MyViewForAddImageView addSubview:iv9];
                
                [iv mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.MyViewForAddImageView).offset(10);
                    make.left.equalTo(self.MyViewForAddImageView).offset(10);
                    make.right.equalTo(iv2.mas_left).offset(-10);
                    make.height.mas_equalTo(w);
                    make.height.equalTo(@[iv.mas_height, iv2.mas_height,iv3.mas_height,iv4.mas_height,iv5.mas_height,iv6.mas_height,iv7.mas_height,iv8.mas_height,iv9.mas_height]);
                    make.width.equalTo(@[iv.mas_width, iv2.mas_width,iv3.mas_width,iv4.mas_width,iv5.mas_width,iv6.mas_width,iv7.mas_width,iv8.mas_width,iv9.mas_width]);
                    make.bottom.equalTo(iv4.mas_top).offset(-10);
                }];
                [iv2 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.MyViewForAddImageView).offset(10);
                    make.right.equalTo(iv3.mas_left).offset(-10);
                    make.bottom.equalTo(iv5.mas_top).offset(-10);
                }];
                [iv3 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.MyViewForAddImageView).offset(10);
                    make.right.equalTo(self.MyViewForAddImageView).offset(-10);
                    make.bottom.equalTo(iv6.mas_top).offset(-10);
                }];
                [iv4 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(self.MyViewForAddImageView).offset(10);
                    make.right.equalTo(iv5.mas_left).offset(-10);
                    make.bottom.equalTo(iv7.mas_top).offset(-10);
                }];
                [iv5 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.equalTo(iv6.mas_left).offset(-10);
                    make.bottom.equalTo(iv8.mas_top).offset(-10);
                }];
                [iv6 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.equalTo(_MyViewForAddImageView).offset(-10);
                    make.bottom.equalTo(iv9.mas_top).offset(-10);
                }];
                [iv7 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(_MyViewForAddImageView).offset(10);
                    make.right.equalTo(iv8.mas_left).offset(-10);
                    make.bottom.equalTo(_MyViewForAddImageView).offset(-10);
                }];
                [iv8 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.equalTo(iv9.mas_left).offset(-10);
                    make.bottom.equalTo(_MyViewForAddImageView).offset(-10);
                }];
                [iv9 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.equalTo(_MyViewForAddImageView).offset(-10);
                    make.bottom.equalTo(_MyViewForAddImageView).offset(-10);
                }];
                
            }
                break;
                
        }//switch结束
        
    }//if 结束
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
