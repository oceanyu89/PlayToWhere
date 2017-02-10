//
//  CustomCellWithAcessoryImage.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/10.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCellWithAcessoryImage : UITableViewCell

+(CustomCellWithAcessoryImage *)initWithCustomWithAccessoryView:(NSString *)imageName andTitle:(NSString *)title andDetail:(NSString *)detail andAccessoryImageName:(NSString*)accessoryImageName;

@end
