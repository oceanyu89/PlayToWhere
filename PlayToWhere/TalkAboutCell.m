//
//  TalkAboutCell.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/27.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "TalkAboutCell.h"

@implementation TalkAboutCell

-(void)setComment:(Comment *)comment
{
    _comment = comment;
    if (comment.total==1) {
        UILabel *first = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, SCREEN_WIDTH, 20)];
        first.font = kFont(8);
        Comments *comments = comment.comments[0];
        NSString *talker =comments.user.username;
        NSString *talkContent =comments.content;
        NSString *all = [talker stringByAppendingFormat:@"：%@",talkContent];
        NSMutableAttributedString *talkerAndContent  = [[NSMutableAttributedString alloc]initWithString:all];
        [talkerAndContent addAttribute:NSForegroundColorAttributeName value: [UIColor redColor] range:NSMakeRange(0, talker.length)];
        [first setAttributedText:talkerAndContent];
    }else if (comment.total==2)
    {
        UILabel *first = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, SCREEN_WIDTH, 20)];
        first.font = kFont(8);
        Comments *comments = comment.comments[0];
        NSString *talker =comments.user.username;
        NSString *talkContent =comments.content;
        NSString *all = [talker stringByAppendingFormat:@"：%@",talkContent];
        NSMutableAttributedString *talkerAndContent  = [[NSMutableAttributedString alloc]initWithString:all];
        [talkerAndContent addAttribute:NSForegroundColorAttributeName value: [UIColor redColor] range:NSMakeRange(0, talker.length)];
        [first setAttributedText:talkerAndContent];
        [self.contentView addSubview:first];
        //
        UILabel *second = [[UILabel alloc]initWithFrame:CGRectMake(5, 35, SCREEN_WIDTH, 20)];
        second.font = kFont(8);
        comments = comment.comments[1];
        talker =comments.user.username;
       talkContent =comments.content;
        all = [talker stringByAppendingFormat:@"：%@",talkContent];
        talkerAndContent  = [[NSMutableAttributedString alloc]initWithString:all];
        [talkerAndContent addAttribute:NSForegroundColorAttributeName value: [UIColor redColor] range:NSMakeRange(0, talker.length)];
        [second setAttributedText:talkerAndContent];
          [self.contentView addSubview:second];
        
    }else {
        UILabel *first = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, SCREEN_WIDTH, 20)];
        first.font = kFont(8);
        Comments *comments = comment.comments[0];
        NSString *talker =comments.user.username;
        NSString *talkContent =comments.content;
        NSString *all = [talker stringByAppendingFormat:@"：%@",talkContent];
        NSMutableAttributedString *talkerAndContent  = [[NSMutableAttributedString alloc]initWithString:all];
        [talkerAndContent addAttribute:NSForegroundColorAttributeName value: [UIColor redColor] range:NSMakeRange(0, talker.length)];
        [first setAttributedText:talkerAndContent];
        [self.contentView addSubview:first];
        //
        UILabel *second = [[UILabel alloc]initWithFrame:CGRectMake(5, 30, SCREEN_WIDTH, 20)];
        second.font = kFont(8);
        comments = comment.comments[1];
        talker =comments.user.username;
        talkContent =comments.content;
        all = [talker stringByAppendingFormat:@"：%@",talkContent];
        talkerAndContent  = [[NSMutableAttributedString alloc]initWithString:all];
        [talkerAndContent addAttribute:NSForegroundColorAttributeName value: [UIColor redColor] range:NSMakeRange(0, talker.length)];
        [second setAttributedText:talkerAndContent];
        [self.contentView addSubview:second];
        //
        UILabel *talkCount = [[UILabel alloc]initWithFrame:CGRectMake(5, 55, SCREEN_WIDTH, 20)];
        talkCount.font = kFont(8);
        talkCount.text = [NSString stringWithFormat:@"查看全部%ld条评论",(long)comment.total];
         [self.contentView addSubview:talkCount];
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
