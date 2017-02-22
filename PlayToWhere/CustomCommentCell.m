//
//  CustomCommentCell.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/16.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "CustomCommentCell.h"

@implementation CustomCommentCell


+(instancetype)getCustomLayoutCell:(UITableView*)tableView andIndexPath:(NSIndexPath *)indexPath
{
//    CustomCommentCell *cell = [[CustomCommentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MycellCustome"];
    CustomCommentCell *cell = [[NSBundle mainBundle]loadNibNamed:@"CustomCommentCell" owner:nil options:nil].firstObject;
    return cell;
}

-(void)setComment:(Comment *)comment
{
//    UILabel *allCommet = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, self.contentView.width-10, 20)];
    _comment =comment;
    UILabel *allCommet = [[UILabel alloc]init];
    allCommet.text = [NSString stringWithFormat:@"查看全部%ld条评论",(long)_comment.total];
    allCommet.numberOfLines = 0;
    [self.bottomView addSubview:allCommet];
    [allCommet mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bottomView).offset(5);
        make.left.equalTo(self.bottomView).offset(10);
        make.right.equalTo(self.bottomView).offset(-10);
        make.height.mas_equalTo(20);
    }];
    allCommet.textColor = [UIColor grayColor];
    allCommet.font = kFont(10);

    if (_comment.total==1)
    {
            Comments *comments = [Comments new];
            User *user = [User new];
            [comments setValuesForKeysWithDictionary:_comment.comments[0]];
//            UILabel *userCommet = [[UILabel alloc]initWithFrame:CGRectMake(10, 30, self.contentView.width-10, 20)];
            UILabel *userCommet = [[UILabel alloc]init];
            [self.bottomView addSubview:userCommet];
            [userCommet mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(allCommet.mas_bottom).offset(5);
                make.left.equalTo(self.bottomView).offset(10);
                make.right.equalTo(self.bottomView).offset(-10);
//               make.height.mas_equalTo(20);
                make.bottom.equalTo(self.bottomView).offset(-10);
            }];
            
            [user setValuesForKeysWithDictionary:(NSDictionary *)comments.user];
            userCommet.text = [NSString stringWithFormat:@"%@:%@",user.username,comments.content];
            userCommet.textColor = [UIColor grayColor];
            userCommet.font = kFont(10);
            userCommet.numberOfLines = 0;
            
        }
    else if (_comment.comments.count>1)
        {
            Comments *comments = [Comments new];
            User *user = [User new];
            [comments setValuesForKeysWithDictionary:_comment.comments[1]];
//            UILabel *userCommet = [[UILabel alloc]initWithFrame:CGRectMake(10, 30, self.contentView.width-10, 20)];
            UILabel *userCommet = [[UILabel alloc]init];
            [self.bottomView addSubview:userCommet];
            [userCommet mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(allCommet.mas_bottom).offset(5);
                make.left.equalTo(self.bottomView).offset(10);
                make.right.equalTo(self.bottomView).offset(-10);
                make.height.mas_equalTo(20);
//               make.bottom.equalTo(self.bottomView).offset(-10);
            }];
            
             [user setValuesForKeysWithDictionary:(NSDictionary *)comments.user];
            userCommet.text = [NSString stringWithFormat:@"%@:%@",user.username,comments.content];
            userCommet.textColor = [UIColor grayColor];
            userCommet.font = kFont(10);
            userCommet.numberOfLines = 0;
            
            Comments *comments2 = [Comments new];
            User *user2 = [User new];
            [comments2 setValuesForKeysWithDictionary:_comment.comments[0]];
//            UILabel *userCommet2 = [[UILabel alloc]initWithFrame:CGRectMake(10, 50, self.contentView.width-10, 20)];
            UILabel *userCommet2 = [[UILabel alloc]init];
            [self.bottomView addSubview:userCommet2];
            [userCommet2 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(userCommet.mas_bottom).offset(5);
                make.left.equalTo(self.bottomView).offset(10);
                make.right.equalTo(self.bottomView).offset(-10);

                make.bottom.equalTo(self.bottomView).offset(-10);
            }];
            
             [user2 setValuesForKeysWithDictionary:(NSDictionary *)comments.user];
            userCommet2.text = [NSString stringWithFormat:@"%@:%@",user2.username,comments2.content];
            userCommet2.textColor = [UIColor grayColor];
            userCommet2.font = kFont(10);
            userCommet2.numberOfLines = 0;
            
        }
    
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
