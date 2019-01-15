//
//  Person.m
//  JJRecursiveBlockDemo
//
//  Created by Liu on 2019/1/15.
//  Copyright © 2019年 Liu. All rights reserved.
//

#import "Person.h"
#import "NewPerson.h"

@implementation Person

- (void)test {
    __weak void (^weak_downloadNextBlock)(void);
    
    NSLog(@"\nLiujiajie:weak_downloadNextBlock1 = %@", weak_downloadNextBlock);
    
    {
        __block NSUInteger time = 0;
        void (^downloadNextBlock)(void); //强指针使得block不会提前被释放
        __block __weak void (^weakdownloadNextBlock)(void); //弱指针进行递归
        weakdownloadNextBlock = downloadNextBlock = ^(void) {
            void (^downloadNextBlock)(void) = weakdownloadNextBlock; //防止线程切换等原因导致weakdownloadNextBlock被提前释放
            NSLog(@"\nLiujiajie:time = %@", @(time));
            if (time >= 20) {
                NSLog(@"\nLiujiajie: nil 1");
                return;
            }
            
            [NewPerson download:time++ completionBlock:^(NSUInteger index) {
                NSLog(@"\nLiujiajie:index = %@", @(index));
                if (index >= 2) {
                    !downloadNextBlock ? NSLog(@"\nLiujiajie: nil, time = %@, index = %@", @(time), @(index)) : downloadNextBlock();
                } else {
                    NSLog(@"\nLiujiajie: nil 2");
                    return;
                }
            }];
        };
        
        weak_downloadNextBlock = downloadNextBlock;
        
        NSLog(@"\nLiujiajie:weak_downloadNextBlock2 = %@", weak_downloadNextBlock);
        
        downloadNextBlock();
    }
    
    NSLog(@"\nLiujiajie:weak_downloadNextBlock3 = %@", weak_downloadNextBlock);
}

- (void)test1 {
    __weak void (^weak_downloadNextBlock)(void);
    
    NSLog(@"\nLiujiajie:weak_downloadNextBlock1 = %@", weak_downloadNextBlock);
    
    {
        __block NSUInteger time = 0;
        __block void (^downloadNextBlock)(void) = ^(void) {            
            NSLog(@"\nLiujiajie:time = %@", @(time));
            if (time >= 5) {
                NSLog(@"\nLiujiajie: nil 1");
                downloadNextBlock = nil;
                return;
            }
            
            [NewPerson download:time++ completionBlock:^(NSUInteger index) {
                NSLog(@"\nLiujiajie:index = %@", @(index));
                if (index != 0) {
                    downloadNextBlock();
                } else {
                    NSLog(@"\nLiujiajie: nil 2");
                    downloadNextBlock = nil;
                }
            }];
        };
        
        weak_downloadNextBlock = downloadNextBlock;
        
        NSLog(@"\nLiujiajie:weak_downloadNextBlock2 = %@", weak_downloadNextBlock);
        
        downloadNextBlock();
    }
    
    NSLog(@"\nLiujiajie:weak_downloadNextBlock3 = %@", weak_downloadNextBlock);
}
@end
