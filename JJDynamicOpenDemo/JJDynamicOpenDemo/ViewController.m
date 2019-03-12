//
//  ViewController.m
//  JJDynamicOpenDemo
//
//  Created by Liu on 2019/3/12.
//  Copyright © 2019年 Liu. All rights reserved.
//

#import "ViewController.h"
#import "JJDynamicLog.h"
#include <dlfcn.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    void *lib = dlopen("./JJDyFrameworkDemo.framework/JJDyFrameworkDemo", RTLD_LAZY);
    if (lib) {
        // 获取类名称
        Class logClass = NSClassFromString(@"JJDynamicLog");
        // 获取函数方法
        SEL selector = NSSelectorFromString(@"d_log:");
        // 调用实例化对象方法
        [[logClass alloc] performSelector:selector withObject:@"输出文件"];
    }
    
    char *error = dlerror();
    if (error != NULL) {
        NSLog(@"dlerror = %@", [NSString stringWithUTF8String:error]);
    }
}


@end
