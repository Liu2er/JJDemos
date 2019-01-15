//
//  JJTextField.m
//  JJTextFieldMemoryLeakDemo
//
//  Created by Liu on 2019/1/15.
//  Copyright © 2019年 Liu. All rights reserved.
//

#import "JJTextField.h"

@interface JJTextField ()

//@property (nonatomic, weak) JJTextField *originalProvider;

@end

@implementation JJTextField

/* 网上的解决方案，然而并没有用
- (void)didMoveToWindow {
    [super didMoveToWindow];
    if (@available(iOS 11.2, *)) {
        NSString *p = @"textContentView.p";
        NSString *keyPath = [NSString stringWithFormat:@"%@rovider", p];
        @try {
            if (self.window) {
                id provider = [self valueForKeyPath:keyPath];
                if (!provider && self.originalProvider) {
                    [self setValue:self.originalProvider forKeyPath:keyPath];
                }
            } else {
                self.originalProvider = [self valueForKeyPath:keyPath];
                [self setValue:nil forKeyPath:keyPath];
            }
        } @catch (NSException *exception) {
            NSLog(@"BDGForbidActionTextField provider exception = %@ dealloc", exception);
        }
    }
}
*/

- (void)dealloc {
    NSLog(@"\nLiujiajie: JJTextField dealloc");
}

@end
