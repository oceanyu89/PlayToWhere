//
//  buttonAndImageView.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/10.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class buttonAndImageView;
@protocol buttonAndImageViewDelegate <NSObject>

-(void)viewClicked:(buttonAndImageView*)buttonAndImageView;

@end
@interface buttonAndImageView : UIView

-(void)createSomeView:(NSString*)imageName andTitle:(NSString *)title andNote:(NSString *)note;

@property (nonatomic,weak) id<buttonAndImageViewDelegate> delegate;
@end
