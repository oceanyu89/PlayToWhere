//
//  IndexCollectionView.m
//  BigImageShow
//
//  Created by liuyan on 16/8/10.
//  Copyright © 2016年 liuyan. All rights reserved.
//

#import "BigImageIndexCollectionView.h"
#import "IndexCollectionCell.h"
#import "IndexFlow.h"
#import "detail_photos.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenheight [UIScreen mainScreen].bounds.size.height

@interface BigImageIndexCollectionView ()<UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property(nonatomic,assign)BOOL isExpand;
@property(nonatomic, assign)BOOL shouldDid;

@end

@implementation BigImageIndexCollectionView

- (id)initWithFrame:(CGRect)frame{
   IndexFlow *flowLayout = [[IndexFlow alloc] init];
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.showsHorizontalScrollIndicator = NO;
        self.isExpand = YES;
        self.backgroundColor = [UIColor colorWithRed:242/255.0 green:247/255.0 blue:252/255.0 alpha:1];
        [self registerNib:[UINib nibWithNibName:@"IndexCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"IndexCollectionCell"];
    }
    return self;
}



#pragma mark - collectionDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.movieModelArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    IndexCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"IndexCollectionCell" forIndexPath:indexPath];
//    cell.imageView.backgroundColor = randomColor;
    detail_photos *photos = self.movieModelArray[indexPath.item];
    [cell.imageView setImageWithURL:[NSURL URLWithString:photos.image.url] placeholderImage:defaultPhoto];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
      [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    if (self.didScrollBlcok) {
        self.didScrollBlcok(indexPath);
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    self.isExpand = NO;
}


- (void)collectionViewDidScrollWithScrollBlock:(IndexScrollBlock)didScrollBlcok{
    self.didScrollBlcok = didScrollBlcok;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint offset = scrollView.contentOffset;
    CGPoint point = self.center;
    point.x = point.x + offset.x;
    NSIndexPath *indexPath = [self indexPathForItemAtPoint:point];
    
    if (self.shouldDid) {
        if (self.didScrollBlcok) {
            self.didScrollBlcok(indexPath);
        }
    }
}


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
     self.shouldDid = YES;
    return YES;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //结束滑动时关闭scrollBlock
    self.isExpand = YES;
    self.shouldDid = NO;
    
    
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    float xOffSet = targetContentOffset->x;
    NSInteger index = (xOffSet + ((_itemWidth + _minLineSpacing) / 2)) / (_itemWidth + _minLineSpacing);
    targetContentOffset->x = index * (_itemWidth + _minLineSpacing);
    self.currentPage = index;
    
}

@end
