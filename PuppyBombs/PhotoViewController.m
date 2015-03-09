//
//  PhotoViewController.m
//  PuppyBombs
//
//  Created by Calvin Nisbet on 2015-03-09.
//  Copyright (c) 2015 Calvin Nisbet. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoCell.h"

@implementation PhotoViewController


- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(106.0, 106.0);
    layout.minimumInteritemSpacing = 1.0;
    layout.minimumLineSpacing = 1.0;
    return (self = [super initWithCollectionViewLayout:layout]);
}

-(void)viewDidLoad
{
    self.collectionView.backgroundColor = [UIColor darkGrayColor];
    [self.collectionView registerClass:[PhotoCell class] forCellWithReuseIdentifier:@"Photo"];
    self.title = @"Puppy Bombs";
    
    
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 12;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Photo" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

@end