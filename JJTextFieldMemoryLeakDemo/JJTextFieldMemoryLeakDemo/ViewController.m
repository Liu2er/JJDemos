//
//  ViewController.m
//  JJTextFieldMemoryLeakDemo
//
//  Created by Liu on 2019/1/15.
//  Copyright © 2019年 Liu. All rights reserved.
//

#import "ViewController.h"
#import "JJViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.button = ({
        CGFloat width = 100;
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - width) / 2, 200, width, 40)];
        [button setTitle:@"弹出新页面" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(dissmissKeyBoard) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor = [UIColor blueColor];
        [self.view addSubview:button];
        button;
    });
}

- (void)dissmissKeyBoard {
    JJViewController *vc = [[JJViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
