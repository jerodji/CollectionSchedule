//
//  UICollectionViewGridLayout.m
//  CollectionSchedule
//
//  Created by Jerod on 2021/2/9.
//

#import "UICollectionViewGridLayout.h"

@interface UICollectionViewGridLayout ()
@property (nonatomic, strong) NSDictionary *layoutInfo;
@end

@implementation UICollectionViewGridLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    // 设置默认值
    self.itemSize = CGSizeMake(50.0, 50.0);
    self.itemSpacing = 10.0;
}

- (void)configureCollectionViewForLayout:(UICollectionView *)collectionView
{
    collectionView.alwaysBounceHorizontal = YES;

    [collectionView setCollectionViewLayout:self animated:NO];
}

// 必须的方法
- (void)prepareLayout
{
    NSMutableDictionary *cellLayoutInfo = [NSMutableDictionary dictionary];

    NSInteger sectionCount = [self.collectionView numberOfSections];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];

    for (NSInteger section = 0; section < sectionCount; section++) {
        NSInteger itemCount = [self.collectionView numberOfItemsInSection:section];

        for (NSInteger item = 0; item < itemCount; item++) {
            indexPath = [NSIndexPath indexPathForItem:item inSection:section];

            UICollectionViewLayoutAttributes *itemAttributes =
            [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            itemAttributes.frame = [self frameForIndexPath:indexPath];

            cellLayoutInfo[indexPath] = itemAttributes;
        }
    }

    self.layoutInfo = cellLayoutInfo;
}

//快速获取给定索引
- (CGRect)frameForIndexPath:(NSIndexPath *)indexPath
{
    NSInteger column = indexPath.section;
    NSInteger row = indexPath.item;

    CGFloat originX = column * (self.itemSize.width + self.itemSpacing);
    CGFloat originY = row * (self.itemSize.height + self.itemSpacing);

    return CGRectMake(originX, originY, self.itemSize.width, self.itemSize.height);
}

//计算内容大小的必需方法。这只是将部分或项目的数量乘以大小和间距属性。这是允许双向滚动的内容，因为内容大小可以大于集合视图的宽度和高度。
- (CGSize)collectionViewContentSize
{
    NSInteger sectionCount = [self.collectionView numberOfSections];

    if (sectionCount == 0) {
        return CGSizeZero;
    }

    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];

    CGFloat width = (self.itemSize.width + self.itemSpacing) * sectionCount - self.itemSpacing;
    CGFloat height = (self.itemSize.height + self.itemSpacing) * itemCount - self.itemSpacing;

    return CGSizeMake(width, height);
}


- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.layoutInfo[indexPath];
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *allAttributes = [NSMutableArray array];

    [self.layoutInfo enumerateKeysAndObjectsUsingBlock:^(NSIndexPath *indexPath, UICollectionViewLayoutAttributes *attributes, BOOL *stop) {
        if (CGRectIntersectsRect(attributes.frame, rect)) {
            [allAttributes addObject:attributes];
        }
    }];

    return allAttributes;
}


@end
