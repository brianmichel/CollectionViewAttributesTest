//
//  ViewController.m
//  CollectionViewAttributesTest
//
//  Created by Brian Michel on 6/27/13.
//  Copyright (c) 2013 Brian Michel. All rights reserved.
//

#import "ViewController.h"
#import "CustomLayout.h"
#import "CustomCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong) UICollectionView *collectionView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor magentaColor];
    CustomLayout *layout = [[CustomLayout alloc] init];
    layout.itemSize = CGSizeMake(100, 100);

    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[CustomCell class] forCellWithReuseIdentifier:@"cell"];
    
    [self.view addSubview:self.collectionView];
	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UICollectionView Datasource / Delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
}

@end
