//
//  FunctionViewForCell.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/24.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "FunctionViewForCell.h"


@interface FunctionViewForCell ()

@end
@implementation FunctionViewForCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.open=YES;
    }
    return self;
}

-(void)setVote_tags:(detail_vote_tags *)vote_tags
{
    _vote_tags = vote_tags;
//    CGFloat w = (SCREEN_WIDTH-20-5*5)/6;
    CGFloat h = 30;
    //第一个 label的起点
    CGSize size = CGSizeMake(5, 40);
    //间距
    CGFloat padding = 5.0;
    detail_tags *tag = [detail_tags new];
    for (int i=0; i<vote_tags.total; i++) {
        tag =vote_tags.tags[i];

        CGFloat keyWorldWidth = [self getSizeByString:tag.tag AndFontSize:9].width;
        if (keyWorldWidth > SCREEN_WIDTH) {
            keyWorldWidth = SCREEN_WIDTH;
        }
        if (SCREEN_WIDTH - size.width < keyWorldWidth) {
            size.height += 40.0;
            size.width = 5.0;
        }
        self.allView = [[HalfCirleBtnWithCirleLabel alloc]initWithFrame:CGRectMake(size.width, size.height-30, keyWorldWidth, h)];
        
        self.allView.tag=i;
        [self.allView.btn setTitle:tag.tag forState:UIControlStateNormal];
        [self.allView.btn addTarget:self  action:@selector(patchOn:) forControlEvents:UIControlEventTouchUpInside];
        self.allView.label.text = @(tag.count).stringValue;
        self.allView.label.tag = i;
        [self addSubview:self.allView];
        //起点 增加
        size.width += keyWorldWidth+padding;
    }
    
}
//计算文字所占大小
- (CGSize)getSizeByString:(NSString*)string AndFontSize:(CGFloat)font
{
    CGSize size = [string boundingRectWithSize:CGSizeMake(999, 25) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    size.width += 50;
    return size;
}

-(void)resetPatchOnBlock:(patchOnBlock)patchOnBlock
{
    self.patchOnBlock = patchOnBlock;
}
-(void)patchOn:(CustomButton_leftTitleRightImage*)sender
{
        if (self.isOpen) {
            sender.backgroundColor = [UIColor redColor];
           CircleLabel *label = objc_getAssociatedObject(sender, "firstObject");        //取参 将传入进来的label取出来进行修改
            label.text = @(label.text.integerValue+1).stringValue;
           self.open=NO;
        }
    else
    {
        self.open=YES;
       sender.backgroundColor = [UIColor colorWith255Red:180 green:199 blue:206 alpha:255];
        CircleLabel *label = objc_getAssociatedObject(sender, "firstObject");        //取参 将传入进来的label取出来进行修改
        label.text = @(label.text.integerValue-1).stringValue;

    }
}





@end
