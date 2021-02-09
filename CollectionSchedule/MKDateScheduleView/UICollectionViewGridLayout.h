//
//  UICollectionViewGridLayout.h
//  CollectionSchedule
//
//  Created by Jerod on 2021/2/9.
//

#import <UIKit/UIKit.h>

/*
 参考文档(可能需要翻墙):
 https://www.codenong.com/29302772/
 */

@interface UICollectionViewGridLayout : UICollectionViewLayout

// properties to configure the size and spacing of the grid
@property (nonatomic) CGSize itemSize;
@property (nonatomic) CGFloat itemSpacing;

// this method was used because I was switching between layouts
- (void)configureCollectionViewForLayout:(UICollectionView *)collectionView;

@end
