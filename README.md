# JJDemos
本仓库是我在开发的过程中遇到的一些有趣的问题，通过 demo 来记录和验证这些问题，以备回顾。



## JJDecodeDemo

这是对一张 10000x10000 的 PNG 大图进行的解码测试，通过 Instruments Allocations 对比惰性解码和预解码的内存消耗。



## JJDSLDemo

参考 [objective-c DSL的实现思路](https://www.jianshu.com/p/7ed4e66c7134) 写了一个 demo，将 Objective-C 的如下形式：

```objective-c
UIView *view = [[UIView alloc] initWithFrame:CGRectMake(50, 60, 70, 80)];
view.backgroundColor = [UIColor redColor];
[self.view addSubview:view];
```

转换为了如下链式形式：

```objective-c
UIView *view = ViewAlloc(UIView).with.postion(90, 100).size(110, 120).backgroundColor(UIColor.blueColor).intoView(self.view);
```




## JJRecursiveBlockDemo

Block 递归有两种实现方式，一种是声明 __weak 变量，另一种是直接递归调用，并在递归结束时置 nil 来释放。

第二种方式更简单易懂，但是有潜在风险，即如果某个终止条件的分支有机会走不到，就会出现内存泄露。



## JJTextFieldMemoryLeakDemo

Instruments Leaks 测到一个特殊 case，即当设置 keyboardType 为 UIKeyboardTypeNumberPad 时，UITextField dealloc 方法能够正常走到，但其内部的 UIKeyboardPredictionView 没有得到释放。实际上这是苹果的缓存策略，从 iOS 11.2 开始出现，无需处理。

本 demo 就是用来验证这一点。



## JJHTTPMockDemo

本意是想测试一下 **GYHttpMock** 这个框架，并阅读一下源码，但是效果和自己预期的不一样，暂时放到这里。





## JJLocalizationDemo

本地化测试 demo，支持简体中文、繁体中文、英文、日文四种语言的**文本**和**图片**的本地化，还可以支持通过按钮切换 APP 的本地化语言环境，重启后生效。

参考了自[3分钟实现iOS语言本地化/国际化（图文详解）](https://www.jianshu.com/p/88c1b65e3ddb)。

<img src="./MDImages/JJLocalizationDemo 01.png" width="90%" />



## JJLoginDemo

Facebook 的第三方登录，先去 Facebook 开发网站注册一个账号，然后按照官网教程一步步操作就可以了，教程参考 [Facebook 开发者官网](https://developers.facebook.com/)、[iOS 版 Facebook 登录 — 快速入门](https://developers.facebook.com/docs/facebook-login/ios)就够了。

注意：FBSDKLoginKit 的 4.39.0 版本有 bug；

<img src="./MDImages/JJLoginDemo 01.gif" width="35%" />

## JJGoogleSignInDemo

根据 Google 的开发者官网 [Start integrating Google Sign-In into your iOS app](https://developers.google.cn/identity/sign-in/ios/start-integrating) 一步步完成的。关于 `CREATE AN OAUTH CLIENT ID` 和 `GET AN EXISTING OAUTH CLIENT ID` 这两步可以参考 Google AdWords 的 [OAuth2 身份验证](https://developers.google.com/adwords/api/docs/guides/authentication)。

注意：Targets -> Info -> URL Types 里配置的 URL Schemes 是 Client ID 的反序，这里写错了会导致崩溃。

<img src="./MDImages/JJGoogleSignInDemo 01.gif" width="35%" />