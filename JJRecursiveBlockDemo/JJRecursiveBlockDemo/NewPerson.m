//
//  NewPerson.m
//  JJRecursiveBlockDemo
//
//  Created by Liu on 2019/1/15.
//  Copyright © 2019年 Liu. All rights reserved.
//

#import "NewPerson.h"

static NSUInteger staticIndex = 8;

@implementation NewPerson

+ (void)download:( NSUInteger)time completionBlock:(void(^)(NSUInteger index))completionBlock {
    __block NSUInteger a = time;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        a++;
        self.index -= 1;
        dispatch_async(dispatch_get_main_queue(), ^{            
            if (self.index >= 5) {
                completionBlock(self.index);
            }
        });
    });
}

+ (NSUInteger)index {
    return staticIndex;
}

+ (void)setIndex:(NSUInteger)index {
    staticIndex = index;
}

@end
