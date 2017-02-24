//
//  BigImageCollectionView.m
//  BigImageShow
//
//  Created by liuyan on 16/8/10.
//  Copyright © 2016年 liuyan. All rights reserved.
//

#import "BigImageCollectionView.h"
#import "BigImageCell.h"
#import "detail_photos.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenheight [UIScreen mainScreen].bounds.size.height

@interface BigImageCollectionView()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(nonatomic, assign)BOOL shouldDid;

@end
@implementation BigImageCollectionView

- (id)initWithFrame:(CGRect)frame{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH, 200);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing=0;
    flowLayout.minimumInteritemSpacing = 0;
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.showsHorizontalScrollIndicator = NO;
        self.pagingEnabled = YES;
        self.bounces = NO;
        self.shouldDid = NO;
        [self registerNib:[UINib nibWithNibName:@"BigImageCell" bundle:nil] forCellWithReuseIdentifier:@"BigImageCell"];
    }
    return self;
}

#pragma mark - collectionDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.movieModelArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BigImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BigImageCell" forIndexPath:indexPath];

    detail_photos *photos = self.movieModelArray[indexPath.item];
        [cell.imageView setImageWithURL:[NSURL URLWithString:photos.image.url] placeholderImage:defaultPhoto];
//    cell.imageView.backgroundColor = randomColor;
    return cell;
}

- (void)collectionViewDidScrollWithScrollBlock:(DidScrollBlock)didScrollBlcok{
    
    self.didScrollBlcok = didScrollBlcok;
    
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    
    self.shouldDid = YES;
    
    return YES;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.shouldDid = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.shouldDid) {
        if (self.didScrollBlcok) {
            self.didScrollBlcok(self);
        }
    }
}



//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    return UIEdgeInsetsMake(0, (kScreenWidth - _itemWidth)/2, 0,  (kScreenWidth - _itemWidth)/2);
//}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    return CGSizeMake(_itemWidth, self.height);
//}
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
//    return _minLineSpacing;
//}






@end
