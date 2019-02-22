//
//  SignOutButton.m
//  JJGoogleSignInDemo
//
//  Created by Liu on 2019/2/21.
//  Copyright © 2019年 Liu. All rights reserved.
//

#import "SignOutButton.h"

@interface SignOutButton ()

@property (nonatomic, strong) UIButton *maskButton;

@end

@implementation SignOutButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(47, 10, 60, 30)];
        label.backgroundColor = [UIColor whiteColor];
        label.text = @"Sign out";
        label.font = [UIFont boldSystemFontOfSize:13.5f];
        label.textColor = [UIColor colorWithRed:103/255.0 green:103/255.0 blue:103/255.0 alpha:1.0];
        [self addSubview:label];
        
        UIButton *maskButton = [[UIButton alloc] initWithFrame:CGRectMake(3, 3, frame.size.width + 14, 30 + 11)];
        [maskButton addTarget:self action:@selector(signOutAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:maskButton];
        _maskButton = maskButton;
    }
    return self;
}

- (void)signOutAction {
    if (self.signOutBlock) {
        self.signOutBlock();
    }
}

@end
