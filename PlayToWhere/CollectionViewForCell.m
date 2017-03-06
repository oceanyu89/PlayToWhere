//
//  CollectionViewForCell.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/28.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "CollectionViewForCell.h"

@interface CollectionViewForCell ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation CollectionViewForCell

- (instancetype)initWithFrame:(CGRect)frame
{
//    self = [super initWithFrame:frame];
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 8;
        layout.minimumInteritemSpacing = 8;
        layout.sectionInset = UIEdgeInsetsMake(8, 8, 8, 8);
        layout.itemSize = CGSizeMake((SCREEN_WIDTH-40)/4, (SCREEN_WIDTH-40)/4);
        self = [super initWithFrame:frame collectionViewLayout:layout];
        if (self) {
            self.delegate = self;
            self.dataSource = self;
            self.showsHorizontalScrollIndicator = NO;
            self.pagingEnabled = YES;
            self.bounces = NO;
            [self registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"collectionCell"];
//            [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
        }
    return self;
}

-(void)gainNumberOfItemsBlock:(NumberItemsBlock)numberOfItemsBlock
{
    self.numberOfItemsBlock = numberOfItemsBlock;
}
-(void)gainCellForItemAtIndexBlock:(CellForItemAtIndexBlock)cellForItemAtIndexBlock
{
    self.cellForItemAtIndexBlock = cellForItemAtIndexBlock;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
//    return 4;
    return self.numberOfItemsBlock(section);
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath

{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];

//    cell.backgroundColor = randomColor;
    self.cellForItemAtIndexBlock(cell,indexPath);
    return cell;
}
@end
