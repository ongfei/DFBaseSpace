//
//  DFBaseTableView.m
//  GoodDoctor
//
//  Created by ongfei on 2020/5/7.
//  Copyright © 2020 litingting. All rights reserved.
//

#import "DFBaseTableView.h"

@implementation DFBaseTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        //适配
        if (@available(iOS 11,*)) {
            if ([self respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
                self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            }
        }
        
//        else {
//            self.automaticallyAdjustsScrollIndicatorInsets = NO;
//        }
        self.backgroundColor = [UIColor whiteColor];
        self.estimatedRowHeight = 100;
        self.estimatedSectionFooterHeight = 0.0;
        self.estimatedSectionHeaderHeight = 0.0;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
//        self.isShowEmptyHolder = YES;
    }
    
    return self;
}

- (void)registCellClass:(id)cellClass {
    if ([cellClass isKindOfClass:[NSString class]]) {
        [self registerClass:NSClassFromString(cellClass) forCellReuseIdentifier:cellClass];
    }
    
    if ([cellClass isKindOfClass:[NSArray class]]) {
        for (NSString *cellStr in cellClass) {
            [self registerClass:NSClassFromString(cellStr) forCellReuseIdentifier:cellStr];
        }
    }
    
    if ([cellClass isKindOfClass:[UITableViewCell class]]) {
        [self registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
    }
}

@end
