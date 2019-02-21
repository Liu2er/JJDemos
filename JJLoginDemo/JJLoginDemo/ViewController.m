//
//  ViewController.m
//  JJLoginDemo
//
//  Created by Liu on 2019/2/20.
//  Copyright © 2019年 Liu. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ViewController ()
@property(nonatomic, strong) FBSDKLoginButton *loginButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    self.loginButton = loginButton;
    // Optional: Place the button in the center of your view.
    loginButton.center = self.view.center;
    loginButton.readPermissions = @[@"public_profile", @"email"];
    [self.view addSubview:loginButton];
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, loginButton.bounds.size.width, loginButton.bounds.size.height)];
    button.center = CGPointMake(self.view.center.x, self.view.center.y + 80);
    button.backgroundColor = loginButton.backgroundColor;
    UIColor *highlightedColor = [UIColor colorWithRed:47.0/255.0 green:71.0/255.0 blue:122.0/255.0 alpha:1.0];
    [button setBackgroundImage:[self.class imagFromColor:highlightedColor] forState:UIControlStateHighlighted];
    button.layer.cornerRadius = 3.f;
    [button setTitle:@"通过URL直接跳转" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13.f];
    [button addTarget:self action:@selector(directJump) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)directJump {
    NSString *authURL = @"fbauth://authorize/?auth_type=rerequest&client_id=384465815676590&default_audience=friends&display=touch&e2e=%7B%22init%22%3A41839.099708207999%7D&fbapp_pres=1&legacy_override=v3.2&redirect_uri=fbconnect%3A%2F%2Fsuccess&response_type=token%2Csigned_request&return_scopes=true&scope=public_profile%2Cemail&sdk=ios&sdk_version=4.40.0&state=%7B%22challenge%22%3A%22%252FrraCTRXRvkwHGiY17iEZF%252F24ZM%253D%22%2C%220_auth_logger_id%22%3A%22FE7B9BD0-B47F-47CD-9F91-F9346AC3F822%22%2C%22com.facebook.sdk_client_state%22%3Atrue%2C%223_method%22%3A%22fb_application_web_auth%22%7D";
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:authURL] options:@{} completionHandler:^(BOOL success) {
        NSLog(@"通过URL直接登录 success = %@", success ? @"YES" : @"NO");
        if (success) {
            self.loginButton.selected = YES;
            NSString *tokenString = @"EAAFdq2xfJq4BAIGHZB6Ka5bsdBLkMIvIek9aDmeCCDIrjuRhrax9GQw6UAbBVQy5rALHPfJjWe3OhOMddkd4TOo04OcIbdNqbVZAeQOxOr7uNZAAXc99ch0IofW2qfjpaOhZBLZCnTggvnyvrd7LLtw9Nd0g9Tsgy8v7wNmxZA7FIGALqG4YuOcRHUFoh8YFUvWrFyh2QEQEXGWv9u9eekzeRlyZA11UbMZD";
            NSDate *expirationDate = [NSDate dateWithTimeIntervalSinceNow:5108195];
            FBSDKAccessToken *token = [[FBSDKAccessToken alloc] initWithTokenString:tokenString
                                                                        permissions:@[@"public_profile", @"email"]
                                                                declinedPermissions:nil
                                                                              appID:@"384465815676590"
                                                                             userID:@"2563383107067825"
                                                                     expirationDate:expirationDate
                                                                        refreshDate:[NSDate date]
                                                           dataAccessExpirationDate:nil];
            [FBSDKAccessToken setCurrentAccessToken:token];
        }
    }];
}

+ (UIImage *)imagFromColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
