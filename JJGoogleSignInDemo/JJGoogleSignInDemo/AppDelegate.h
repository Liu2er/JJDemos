//
//  AppDelegate.h
//  JJGoogleSignInDemo
//
//  Created by Liu on 2019/2/21.
//  Copyright © 2019年 Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GoogleSignIn;

@interface AppDelegate : UIResponder <UIApplicationDelegate, GIDSignInDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

