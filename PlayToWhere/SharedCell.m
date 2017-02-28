//
//  SharedCell.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/27.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "SharedCell.h"

@interface SharedCell ()
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet CircleButton *userHeadBtn;
@property (weak, nonatomic) IBOutlet UIButton *addressBtn;
@property (weak, nonatomic) IBOutlet UIButton *showBtn;
@end

@implementation SharedCell

-(void)setList:(detail_list *)list
{
    _list = list;
    detail_photos *photos = list.photos[0];
    [self.showBtn setBackgroundImageForState:UIControlStateNormal withURL:[NSURL URLWithString:photos.image.url] placeholderImage:defaultPhoto];
    self.userName.text = list.user.username;
    [self.userHeadBtn setBackgroundImageForState:UIControlStateNormal withURL:[NSURL URLWithString:list.user.headimg] placeholderImage:defaultPhoto];
    [self.addressBtn setTitle:list.location forState:UIControlStateNormal];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
