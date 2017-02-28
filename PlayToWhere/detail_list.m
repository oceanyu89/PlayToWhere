//
//  detail_list.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/23.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "detail_list.h"
#import "YYTextView.h"
@implementation detail_list
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"uid" : @"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"photos" : [detail_photos class]};
}

-(float)textHeight{
    
    YYTextView *tv = [[YYTextView alloc]initWithFrame:CGRectMake(40, 10, SCREEN_WIDTH-80,0)];
    
    tv.text = self.title;
    return tv.textLayout.textBoundingSize.height+10;//cell高度和cell.contentview高度，textview高度不变，所以离底边高出10，
}
-(float)buttonHeight
{
    if (self.vote_tags.tags.count<5) {
        return 44+10;
    }
    else if(self.vote_tags.tags.count>4&&self.vote_tags.tags.count<10)
    {
        return 44*2+10;
    }
    else
    {
        return 44*3+10;
    }
        
}
-(float)talkAboutHeight
{
    if (self.comment.total==1) {
        return 20+5+5;
    }
    if (self.comment.total==2) {
        return 20+20+5+5+5;
    }
    return 20+20+20+5+5+5+5;
}

@end

@implementation detail_vote

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"users" : [detail_user class]};
}

@end






