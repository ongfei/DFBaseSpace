//
//  UICollectionView+DFReload.m
//  GoodDoctor
//
//  Created by ongfei on 2020/12/13.
//  Copyright © 2020 litingting. All rights reserved.
//

#import "UICollectionView+DFReload.h"

@implementation UICollectionView (DFReload)

- (void)dfReloadData {
    [self reloadData];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:(UICollectionViewScrollPositionNone) animated:NO];
    });
}

@end
