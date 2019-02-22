//
//  SignOutButton.h
//  JJGoogleSignInDemo
//
//  Created by Liu on 2019/2/21.
//  Copyright © 2019年 Liu. All rights reserved.
//

#import <GoogleSignIn/GoogleSignIn.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SignOutButtonBlock)(void);

@interface SignOutButton : GIDSignInButton

@property (nonatomic, copy) SignOutButtonBlock signOutBlock;

@end

NS_ASSUME_NONNULL_END
