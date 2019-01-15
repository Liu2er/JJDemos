//
//  JJViewController.m
//  JJTextFieldMemoryLeakDemo
//
//  Created by Liu on 2019/1/15.
//  Copyright © 2019年 Liu. All rights reserved.
//

#import "JJViewController.h"
#import "JJTextField.h"

@interface JJViewController ()

@property (nonatomic, strong) JJTextField *textField;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIButton *closeBtn;

@end

@implementation JJViewController

- (void)viewDidLoad {
    [super viewDidLoad];    
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.textField = ({
        CGFloat width = 200;
        JJTextField *textField = [[JJTextField alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - width) / 2, 50, width, 40)];
        textField.backgroundColor = [UIColor lightGrayColor];
        textField.keyboardType = UIKeyboardTypeNumberPad; //设置了本type会引起UIKeyboardPredictionView无法释放
        [self.view addSubview:textField];
        textField;
    });
    
    self.button = ({
        CGFloat width = 100;
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - width) / 2, 200, width, 40)];
        [button setTitle:@"键盘消失" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(dissmissKeyBoard) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor = [UIColor blueColor];
        [self.view addSubview:button];
        button;
    });
    
    self.closeBtn = ({
        CGFloat width = 100;
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - width) / 2, 400, width, 40)];
        [button setTitle:@"关闭页面" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(closeVC) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor = [UIColor blueColor];
        [self.view addSubview:button];
        button;
    });
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.textField becomeFirstResponder];
}

- (void)dissmissKeyBoard {
    [self.textField resignFirstResponder];
}

- (void)closeVC {
    [self.textField resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc {
    NSLog(@"\nLiujiajie: JJViewController dealloc");
}

@end
