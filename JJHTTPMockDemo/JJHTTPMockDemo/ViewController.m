//
//  ViewController.m
//  JJHTTPMockDemo
//
//  Created by Liu on 2019/2/15.
//  Copyright © 2019年 Liu. All rights reserved.
//

#import "ViewController.h"
#import "GYHttpMock.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:218/255.0 green:98/255.0 blue:73/255.0 alpha:1.0];
    
//    mockRequest(@"GET", @"https://www.baidu.com/").andReturn(201).withHeaders(@{@"Content-Type": @"application/json111"});
//    mockRequest(@"GET", @"https://www.baidu.com/").isUpdatePartResponseBody(YES);
//    mockRequest(@"GET", @"https://www.baidu.com/");
    
//    [self getURLSession];
    [self webViewSession];
}

- (void)postURLSession {
    // 快捷方式获得session对象
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURL *url = [NSURL URLWithString:@"https://weread.qq.com/"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [@"name=abc&pwd=123" dataUsingEncoding:NSUTF8StringEncoding];
    
    // 通过URL初始化task,在block内部可以直接对返回的数据进行处理
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"response = %@", response);
        if (error) {
            NSLog(@"error = %@", error);
        }
        
        NSLog(@"data = %@", data);
    }];
    
    // 启动任务
    [task resume];
}

- (void)getURLSession {
    // 快捷方式获得session对象
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com/"];
    NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"response = %@", response);
        if (error) {
            NSLog(@"error = %@", error);
        }
    }];
    
    // 启动任务
    [task resume];
}

- (void)webViewSession {
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width)];
    webView.center = self.view.center;
    [self.view addSubview:webView];
    
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com/"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [webView loadRequest:request];
}


@end
