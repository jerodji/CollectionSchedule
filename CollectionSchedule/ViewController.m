//
//  ViewController.m
//  CollectionSchedule
//
//  Created by Jerod on 2021/2/9.
//

#import "ViewController.h"
#import "UICollectionViewGridLayout.h"
#import "MKClassTimeCell.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.lightGrayColor;
    [self renderSchedule];
}

- (void)renderSchedule {
    
    UICollectionViewGridLayout *layout = [[UICollectionViewGridLayout alloc] init];
    layout.itemSize = CGSizeMake(100, 50);
    layout.itemSpacing = 30.0f;
//    layout.minimumLineSpacing = 10;
//    layout.minimumInteritemSpacing = 30;
//    layout.headerReferenceSize = CGSizeMake(100, 50);
//    layout.scrollDirection = UICollectionViewScrollDirectionVertical | UICollectionViewScrollDirectionHorizontal;
//    layout.scrollDirection = 1;
        
    
    UICollectionView * collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 20, 375, 627) collectionViewLayout:layout];
    collection.backgroundColor = UIColor.whiteColor;
    collection.delegate = self;
    collection.dataSource = self;
    [collection registerClass:[MKClassTimeCell class] forCellWithReuseIdentifier:@"cellid"];
    [collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    [self.view addSubview:collection];
    collection.contentInset = UIEdgeInsetsMake(80, 0, 0, 0);
}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 14;//14
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 28;//28
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MKClassTimeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:0.3];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld-%ld", (long)indexPath.section, (long)indexPath.row];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId" forIndexPath:indexPath];
    header.frame = CGRectMake(0, 0, 100, 100);
    header.backgroundColor = UIColor.systemPinkColor;
    return header;
}


@end
