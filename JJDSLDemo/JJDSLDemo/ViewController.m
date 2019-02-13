//
//  ViewController.m
//  JJDSLDemo
//
//  Created by Liu on 2019/2/13.
//  Copyright © 2019年 Liu. All rights reserved.
//

#import "ViewController.h"
#import "ViewMaker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(50, 60, 70, 80)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    // 链式写法，参考https://www.jianshu.com/p/7ed4e66c7134
    UIView *view2 = ViewAlloc(UIView).with.postion(90, 100).size(110, 120).backgroundColor(UIColor.blueColor).intoView(self.view);
}


@end
