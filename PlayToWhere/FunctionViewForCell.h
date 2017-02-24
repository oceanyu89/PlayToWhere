//
//  FunctionViewForCell.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/24.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "detail_vote_tags.h"
#import "HalfCirleBtnWithCirleLabel.h"
#import "CircleLabel.h"
typedef void (^patchOnBlock)();
@class FunctionViewForCell;
@protocol FunctionViewForCellDelegate <NSObject>

-(void)patchOnChangeBackgroundColor:(FunctionViewForCell*)FunctionViewForCell;

@end

@interface FunctionViewForCell : UIView
@property(nonatomic,strong)detail_vote_tags *vote_tags;
@property(nonatomic,strong)HalfCirleBtnWithCirleLabel *allView;
@property (nonatomic,assign,getter=isOpen) BOOL open;

@property (nonatomic,weak)  patchOnBlock patchOnBlock;
-(void)resetPatchOnBlock:(patchOnBlock)patchOnBlock;

@property (nonatomic,weak) id<FunctionViewForCellDelegate> delegate;

@end
