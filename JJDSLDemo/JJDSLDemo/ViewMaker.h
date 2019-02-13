//
//  ViewMaker.h
//  JJDSLDemo
//
//  Created by Liu on 2019/2/13.
//  Copyright © 2019年 Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define ViewAlloc(aClass) View_Alloc([aClass class])

@interface ViewMaker : NSObject

@property (nonatomic, strong) Class viewClass;
@property (nonatomic, strong, readonly) ViewMaker *with;

@property (nonatomic, copy) ViewMaker * (^postion)(CGFloat x, CGFloat y);
@property (nonatomic, copy) ViewMaker * (^size)(CGFloat width, CGFloat height);
@property (nonatomic, copy) ViewMaker * (^backgroundColor)(UIColor *color);
@property (nonatomic, copy) UIView * (^intoView)(UIView *superView);

ViewMaker * View_Alloc(Class aClass);

@end

NS_ASSUME_NONNULL_END
