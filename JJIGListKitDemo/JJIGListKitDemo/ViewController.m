//
//  ViewController.m
//  JJIGListKitDemo
//
//  Created by Liu on 2019/3/26.
//  Copyright © 2019年 Liu. All rights reserved.
//

#import "ViewController.h"
#import <IGListKit.h>
#import "SectionController.h"

@interface ViewController () <IGListAdapterDataSource>

@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) IGListCollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.collectionView];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
}

#pragma mark - Lazy Class

- (IGListCollectionView *)collectionView {
    if (!_collectionView) {
        IGListCollectionViewLayout *layout = [[IGListCollectionViewLayout alloc] initWithStickyHeaders:NO topContentInset:0 stretchToEdge:NO];
        _collectionView = [[IGListCollectionView alloc] initWithFrame:self.view.bounds listCollectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor orangeColor];
    }
    return _collectionView;
}

- (IGListAdapter *)adapter {
    if (!_adapter) {
        IGListAdapterUpdater *updater = [[IGListAdapterUpdater alloc] init];
        _adapter = [[IGListAdapter alloc] initWithUpdater:updater viewController:self workingRangeSize:0];
    }
    return _adapter;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[
                       @"标题1",
                       @"标题2",
                       @"标题3"
                       ].mutableCopy;
    }
    return _dataArray;
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.dataArray;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    SectionController *sectionController = [[SectionController alloc] init];
    return sectionController;
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    UIView *emptyView = [[UIView alloc] initWithFrame:self.view.bounds];
    emptyView.backgroundColor = [UIColor redColor];
    return emptyView;
}

@end
