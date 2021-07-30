//
//  DFBaseScrollView.m
//  GoodDoctor
//
//  Created by ongfei on 2020/5/7.
//  Copyright © 2020 litingting. All rights reserved.
//

#import "DFBaseScrollView.h"

@implementation DFBaseScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //适配
        if (@available(iOS 11,*)) {
            if ([self respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
                self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            }
        }
    }
    return self;
}



@end
