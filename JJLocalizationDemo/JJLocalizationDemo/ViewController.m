//
//  ViewController.m
//  JJLocalizationDemo
//
//  Created by Liu on 2019/2/18.
//  Copyright © 2019年 Liu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *switchBtn;
@property (nonatomic, strong) NSMutableArray *languages;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //参考：3分钟实现iOS语言本地化/国际化（图文详解） https://www.jianshu.com/p/88c1b65e3ddb
    
    NSArray *languages = [[NSUserDefaults standardUserDefaults] valueForKey:@"AppleLanguages"];
    self.languages = languages.mutableCopy;
    NSLog(@"启动时 语言列表 = %@", languages);
    
    NSNumber *valid = [[NSUserDefaults standardUserDefaults] valueForKey:@"kRemovedLastCurrentItem"];
    if (!valid) {
        [self.languages removeLastObject];
        valid = @YES;
        [[NSUserDefaults standardUserDefaults] setValue:valid forKey:@"kRemovedLastCurrentItem"];
    }
    
    self.imageView = ({
        CGFloat width = 350;
        CGFloat left = (self.view.bounds.size.width - width)/2;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(left, 130, width, 250)];
        NSString *imageNamed = NSLocalizedString(@"icon.jpg", nil);
        imageView.image = [UIImage imageNamed:imageNamed];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.layer.masksToBounds = YES;
        imageView.layer.borderWidth = 0.5f;
        imageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [self.view addSubview:imageView];
        imageView;
    });
    
    self.switchBtn = ({
        UIButton *switchBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 350, 40)];
        switchBtn.center = self.view.center;
        NSString *title = NSLocalizedString(@"点击", nil);
        [switchBtn setTitle:title forState:UIControlStateNormal];
        [switchBtn setTitle:title forState:UIControlStateHighlighted];
        [switchBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        switchBtn.layer.borderWidth = 0.5f;
        switchBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        switchBtn.layer.cornerRadius = 10.f;
        [switchBtn addTarget:self action:@selector(switchLanguages) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:switchBtn];
        switchBtn;
    });
}

- (void)switchLanguages {
    NSString *current = self.languages.firstObject;
    [self.languages removeObjectAtIndex:0];
    [self.languages addObject:current];
    
    NSLog(@"切换后 语言列表 = %@", self.languages);
    
    [[NSUserDefaults standardUserDefaults] setValue:self.languages forKey:@"AppleLanguages"];
}

@end
