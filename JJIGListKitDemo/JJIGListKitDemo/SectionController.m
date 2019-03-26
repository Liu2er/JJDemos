//
//  SectionController.m
//  JJIGListKitDemo
//
//  Created by Liu on 2019/3/26.
//  Copyright © 2019年 Liu. All rights reserved.
//

#import "SectionController.h"
#import "CollectionViewCell.h"

@implementation SectionController

- (NSInteger)numberOfItems {
    return 4;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 50);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    CollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[CollectionViewCell class] forSectionController:self atIndex:index];
    cell.label.text = [NSString stringWithFormat:@"index = %@", @(index)];
    return cell;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"点击Section%ld  row%ld", (long)self.section, (long)index);
}

@end
