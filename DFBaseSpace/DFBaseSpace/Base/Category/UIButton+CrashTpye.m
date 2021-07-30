//
//  UIButton+CrashTpye.m
//  GoodDoctor
//
//  Created by ongfei on 2020/6/13.
//  Copyright © 2020 litingting. All rights reserved.
//

#import "UIButton+CrashTpye.h"
#import <objc/runtime.h>

@implementation UIButton (CrashTpye)

+ (void)load {
    Method originalM = class_getInstanceMethod([self class], @selector(setTitle:));
    Method exchangeM = class_getInstanceMethod([self class], @selector(transeSetTitle:));
    method_exchangeImplementations(originalM, exchangeM);
    Method originalM1 = class_getInstanceMethod([self class], @selector(setTitle:forState:));
    Method exchangeM1 = class_getInstanceMethod([self class], @selector(transeSetTitle:forState:));
    method_exchangeImplementations(originalM1, exchangeM1);
}

- (void)transeSetTitle:(nullable NSString *)title forState:(UIControlState)state {
    if ([title isKindOfClass:[NSNumber class]]) {
        title = [NSString stringWithFormat:@"%@",title];
    }
    [self transeSetTitle:title forState:state];
}

- (void)transeSetTitle:(NSString *)title {
    if ([title isKindOfClass:[NSNumber class]]) {
        title = [NSString stringWithFormat:@"%@",title];
    }
    [self transeSetTitle:title];
}

@end
