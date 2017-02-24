//
//  DescribeViewForCell.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/23.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "DescribeViewForCell.h"

@implementation DescribeViewForCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *topImage = [UIImageView new];
        topImage.image = [UIImage imageNamed:@"card-quotes-left"];
        
        UIImageView *buttomImage = [UIImageView new];
        buttomImage.image = [UIImage imageNamed:@"card-quotes-rignt"];
        
        
        [self addSubview:topImage];
        [self addSubview:buttomImage];
        
        
        [topImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(10);
            make.left.equalTo(self).offset(10);
            make.width.mas_equalTo(20);
            make.height.mas_equalTo(20);
        }];
        [buttomImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self).offset(-10);
            make.right.equalTo(self).offset(-10);
            make.width.mas_equalTo(20);
            make.height.mas_equalTo(20);
        }];
    }
    return self;
}

-(void)setDescribe:(NSString *)describe
{
    _describe = describe;
    YYTextView *describetv = [[YYTextView alloc]initWithFrame:CGRectMake(40, 10, SCREEN_WIDTH-80, 0)];
    describetv.text =describe;
    //更新控件的高度
    CGRect frame = describetv.frame;
    frame.size.height = describetv.textLayout.textBoundingSize.height;
    describetv.frame = frame;
    describetv.editable = NO;
    [self addSubview:describetv];

    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
