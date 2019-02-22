//
//  ViewController.m
//  JJGoogleSignInDemo
//
//  Created by Liu on 2019/2/21.
//  Copyright © 2019年 Liu. All rights reserved.
//

#import "ViewController.h"
#import "SignOutButton.h"

@interface ViewController ()

@property(nonatomic, strong) GIDSignInButton *signInButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // TODO(developer) Configure the sign-in button look/feel
    CGFloat buttonWidth = 100;
    
    self.signInButton = ({
        GIDSignInButton *signInButton = [[GIDSignInButton alloc] initWithFrame:CGRectMake(0, 0, buttonWidth, 30)];
        signInButton.center = CGPointMake(self.view.center.x / 2, self.view.center.y);
        [self.view addSubview:signInButton];
        signInButton;
    });
    
    [GIDSignIn sharedInstance].uiDelegate = self;
    
    // Uncomment to automatically sign in the user.
    // [[GIDSignIn sharedInstance] signInSilently];
    
    SignOutButton *signOutButton = [[SignOutButton alloc] initWithFrame:CGRectMake(0, 0, buttonWidth, 30)];
    signOutButton.center = CGPointMake(self.view.center.x / 2 * 3, self.view.center.y);
    signOutButton.signOutBlock = ^{
        [[GIDSignIn sharedInstance] signOut];
        [[GIDSignIn sharedInstance] disconnect];
    };
    [self.view addSubview:signOutButton];
}

@end
