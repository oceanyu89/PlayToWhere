//
//  SectionView.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/20.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SectionView;
@protocol SectionViewDelegate <NSObject>

-(void)changeCV:(SectionView*)SectionView andBtn:(UIButton *)sender;
@end
@interface SectionView : UIView

@property (nonatomic,weak) id<SectionViewDelegate> delegate;
@end
