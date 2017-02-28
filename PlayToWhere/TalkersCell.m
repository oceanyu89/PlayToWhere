//
//  TalkersCell.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/27.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "TalkersCell.h"
#import "CircleButton.h"
@implementation TalkersCell

-(void)setVote:(detail_vote *)vote
{
    _vote = vote;
    
    NSInteger count = vote.users.count;
    NSInteger number= (SCREEN_WIDTH-30-10)/40;
    NSInteger tempCount = count>number?number:count;
    
    for (int i =0; i<tempCount; i++) {
        CircleButton *btn = [CircleButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(10+i*(30+5),7, 30, 30);
        detail_user *user = vote.users[i];
        [btn setBackgroundImageForState:UIControlStateNormal withURL:[NSURL URLWithString:user.headimg] placeholderImage:defaultPhoto];
        [btn addTarget:self action:@selector(clickToDetail:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];
    }
    UIButton *more = [UIButton buttonWithType:UIButtonTypeCustom];
    more.frame = CGRectMake(SCREEN_WIDTH-40, 7, 30, 30);
    [more setTitle:@"更多" forState:UIControlStateNormal];
    more.titleLabel.font = kFont(10);
    [more setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.contentView addSubview:more];
}
-(void)clickToDetail:(CircleButton*)sender
{
    
}
+(TalkersCell*)getCustomCellAtTalker
{
    
    TalkersCell *cell =[TalkersCell new];
    return cell;
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
