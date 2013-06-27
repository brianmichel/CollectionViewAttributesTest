//
//  CustomLayout.m
//  CollectionViewAttributesTest
//
//  Created by Brian Michel on 6/27/13.
//  Copyright (c) 2013 Brian Michel. All rights reserved.
//

#import "CustomLayout.h"

@interface CustomLayout ()
@property (strong) NSArray *attributes;
@end

@implementation CustomLayout

+ (Class)layoutAttributesClass {
    return [CustomLayoutAttributes class];
}

- (void)prepareLayout {
    [super prepareLayout];
    NSMutableArray *tmpArray = [NSMutableArray array];
    NSInteger numberOfItemsInSectionZero = [self.collectionView numberOfItemsInSection:0];
    
    for (int i = 0; i < numberOfItemsInSectionZero; i++) {
        CustomLayoutAttributes *attrib = (CustomLayoutAttributes *)[self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        attrib.displayString = [NSString stringWithFormat:@"Item %i", i];
        [tmpArray addObject:attrib];
    }
    self.attributes = [NSArray arrayWithArray:tmpArray];
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    __block NSMutableArray *returnArray = [NSMutableArray array];
    
    [self.attributes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        CustomLayoutAttributes *attribs = (CustomLayoutAttributes *)obj;
        if (CGRectIntersectsRect(rect, attribs.frame)) {
            [returnArray addObject:attribs];
        }
    }];
    
    return [NSArray arrayWithArray:returnArray];
}

@end

@implementation CustomLayoutAttributes
#pragma message("Comment out this copyWithZone: to see that no value is passed to the CustomCell")

- (id)copyWithZone:(NSZone *)zone {
    CustomLayoutAttributes *copy = [super copyWithZone:zone];
    copy.displayString = self.displayString;
    
    return copy;
}
@end
