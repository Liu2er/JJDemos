//
//  CollectionViewCell.m
//  JJIGListKitDemo
//
//  Created by Liu on 2019/3/26.
//  Copyright © 2019年 Liu. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat red = arc4random() / (CGFloat)INT_MAX;
        CGFloat green = arc4random() / (CGFloat)INT_MAX;
        CGFloat blue = arc4random() / (CGFloat)INT_MAX;
        self.contentView.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
        
        _label = ({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
            [self.contentView addSubview:label];
            label;
        });
    }
    return self;
}

@end
