//
//  CustomCell.m
//  CollectionViewAttributesTest
//
//  Created by Brian Michel on 6/27/13.
//  Copyright (c) 2013 Brian Michel. All rights reserved.
//

#import "CustomCell.h"
#import "CustomLayout.h"

@interface CustomCell ()
@property (strong) UILabel *displayLabel;
@end

@implementation CustomCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.displayLabel = [[UILabel alloc] initWithFrame:frame];
        self.displayLabel.textAlignment = NSTextAlignmentCenter;
        self.displayLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self.contentView addSubview:self.displayLabel];
    }
    return self;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    NSString *displayString = @"NO VALUE";
    if ([layoutAttributes isKindOfClass:[CustomLayoutAttributes class]]) {
        displayString = ((CustomLayoutAttributes *)layoutAttributes).displayString ? ((CustomLayoutAttributes *)layoutAttributes).displayString : @"NO VALUE";
    }
    self.displayLabel.text = displayString;
}

@end
