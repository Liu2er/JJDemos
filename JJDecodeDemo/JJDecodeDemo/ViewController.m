//
//  ViewController.m
//  JJDecodeDemo
//
//  Created by Liu on 2019/1/24.
//  Copyright © 2019年 Liu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat imageViewWidth = self.view.bounds.size.width;
    CGFloat top = (self.view.bounds.size.height - self.view.bounds.size.width) / 2;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, top, imageViewWidth, imageViewWidth)];
    [self.view addSubview:imageView];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"10000_10000" ofType:@"png"];
    NSData *imageData = [NSData dataWithContentsOfFile:path];
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)imageData, NULL);
    CGImageRef imageRef = CGImageSourceCreateImageAtIndex(source, 0, NULL);
    NSCParameterAssert(imageRef);

    CGFloat width = CGImageGetWidth(imageRef);
    CGFloat height = CGImageGetHeight(imageRef);
    CGColorSpaceRef spaceRef = CGImageGetColorSpace(imageRef);
    CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(imageRef) & kCGBitmapAlphaInfoMask;
    BOOL hasAlpha = NO;
    if (alphaInfo == kCGImageAlphaPremultipliedLast ||
        alphaInfo == kCGImageAlphaPremultipliedFirst ||
        alphaInfo == kCGImageAlphaLast ||
        alphaInfo == kCGImageAlphaFirst) {
        hasAlpha = YES;
    }
    CGBitmapInfo bitmapInfo = kCGBitmapByteOrder32Host;
    bitmapInfo |= hasAlpha ? kCGImageAlphaPremultipliedFirst : kCGImageAlphaNoneSkipFirst;
    CGContextRef contextRef = CGBitmapContextCreate(NULL, width, height, 8, 0, spaceRef, bitmapInfo);
    CGContextDrawImage(contextRef, CGRectMake(0, 0, width, height), imageRef);
    CGImageRef preImageRef = CGBitmapContextCreateImage(contextRef); //ImageIO_PNG_Data
    NSCParameterAssert(preImageRef);
    
    UIImage *decompressedImage = [UIImage imageWithCGImage:preImageRef scale:1 orientation:0];
    imageView.image = decompressedImage;
}

@end
