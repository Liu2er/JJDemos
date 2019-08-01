//
//  ViewController.m
//  JJARFaceDistanceDemo
//
//  Created by Liu on 2019/8/1.
//  Copyright © 2019 Liu. All rights reserved.
//

#import "ViewController.h"
#import <ARKit/ARKit.h>

@interface ViewController () <ARSCNViewDelegate>

@property (strong, nonatomic) IBOutlet ARSCNView *senceView;

@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIView *mask;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mask = ({
        UIView *mask = [[UIView alloc] initWithFrame:self.view.bounds];
        mask.backgroundColor = [UIColor whiteColor];
        mask.alpha = 0.4;
        [self.view addSubview:mask];
        mask;
    });
    
    self.label = ({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 400, 100)];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor redColor];
        [self.view addSubview:label];
        label;
    });
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    ARFaceTrackingConfiguration *configuration = [ARFaceTrackingConfiguration new];
    [self.senceView.session runWithConfiguration:configuration];
    self.senceView.delegate = self;
}

#pragma mark - ARSCNViewDelegate

- (SCNNode *)renderer:(id<SCNSceneRenderer>)renderer nodeForAnchor:(ARAnchor *)anchor {
    id<MTLDevice> device = self.senceView.device;
    ARSCNFaceGeometry *faceGeometry = [ARSCNFaceGeometry faceGeometryWithDevice:device];
    SCNNode *node = [SCNNode nodeWithGeometry:faceGeometry];
    node.geometry.firstMaterial.fillMode = SCNFillModeLines;
    return node;
}

- (void)renderer:(id <SCNSceneRenderer>)renderer didUpdateNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor {
    ARSCNFaceGeometry *faceGeometry = (ARSCNFaceGeometry *)node.geometry;
    [faceGeometry updateFromFaceGeometry:[(ARFaceAnchor *)anchor geometry]];
    simd_float4 distance4 = anchor.transform.columns[3];
    CGFloat distance = distance4[2];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.label.text = [NSString stringWithFormat:@"眼睛到屏幕的距离为：%.2fcm", fabs(distance * 100)];
        
        if (fabs(distance * 100) < 40) {
            self.mask.hidden = NO;
        } else {
            self.mask.hidden = YES;
        }
    });
}


@end
