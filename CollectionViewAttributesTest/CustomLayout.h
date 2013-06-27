//
//  CustomLayout.h
//  CollectionViewAttributesTest
//
//  Created by Brian Michel on 6/27/13.
//  Copyright (c) 2013 Brian Michel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomLayout : UICollectionViewFlowLayout

@end

@interface CustomLayoutAttributes : UICollectionViewLayoutAttributes
@property (strong) NSString *displayString;
@end
