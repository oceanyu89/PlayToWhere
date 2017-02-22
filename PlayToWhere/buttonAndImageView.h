//
//  buttonAndImageView.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/10.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "list_model.h"
@class buttonAndImageView;
@protocol buttonAndImageViewDelegate <NSObject>

-(void)viewClicked:(buttonAndImageView*)buttonAndImageView andLists:(list_model*)lists;

@end
@interface buttonAndImageView : UIView

-(void)createSomeView:(NSString*)imageName andTitle:(NSString *)title andNote:(NSString *)note;
@property(nonatomic,strong)list_model *lists;
@property (nonatomic,weak) id<buttonAndImageViewDelegate> delegate;
@end
