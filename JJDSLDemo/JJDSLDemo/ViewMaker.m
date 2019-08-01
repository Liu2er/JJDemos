//
//  ViewMaker.m
//  JJDSLDemo
//
//  Created by Liu on 2019/2/13.
//  Copyright © 2019年 Liu. All rights reserved.
//

#import "ViewMaker.h"

@interface ViewMaker ()

@property (nonatomic, assign) CGPoint myPosition;
@property (nonatomic, assign) CGSize mySize;
@property (nonatomic, strong) UIColor *myBackgroundColor;

@end

@implementation ViewMaker

- (instancetype)init {
    self = [super init];
    if (self) {
        __weak typeof(self) weakSelf = self;
        
        _postion = ^ViewMaker *(CGFloat x, CGFloat y) {
            __strong typeof(self) self = weakSelf;
            self.myPosition = CGPointMake(x, y);
            return self;
            
        };
        
        _size = ^ViewMaker *(CGFloat width, CGFloat height) {
            __strong typeof(self) self = weakSelf;
            self.mySize = CGSizeMake(width, height);
            return self;
        };
        
//        _backgroundColor = ^ViewMaker *(UIColor *color) {
//            __strong typeof(self) self = weakSelf;
//            self.myBackgroundColor = color;
//            return self;
//        };
        
        _intoView = ^UIView * (UIView *superView) {
            __strong typeof(self) self = weakSelf;
            UIView *view = [[UIView alloc] init];
            view.frame = CGRectMake(self.myPosition.x, self.myPosition.y, self.mySize.width, self.mySize.height);
            view.backgroundColor = self.myBackgroundColor;
            [superView addSubview:view];
            return view;
        };
    }
    return self;
}

- (ViewMaker *)with {
    return self;
}

- (ColorBlock)backgroundColor {
    ColorBlock myColor = ^ViewMaker *(UIColor *color) {
        self.myBackgroundColor = color;
        return self;
    };
    return myColor;
}

@end

ViewMaker * View_Alloc(Class aClass) {
    ViewMaker *maker = ViewMaker.new;
    maker.viewClass = aClass;
    return maker;
}
