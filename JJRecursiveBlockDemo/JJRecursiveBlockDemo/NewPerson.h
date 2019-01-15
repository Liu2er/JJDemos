//
//  NewPerson.h
//  JJRecursiveBlockDemo
//
//  Created by Liu on 2019/1/15.
//  Copyright © 2019年 Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewPerson : NSObject

@property (nonatomic, assign, class) NSUInteger index;

+ (void)download:(NSUInteger)time completionBlock:(void(^)(NSUInteger index))completionBlock;

@end

NS_ASSUME_NONNULL_END
