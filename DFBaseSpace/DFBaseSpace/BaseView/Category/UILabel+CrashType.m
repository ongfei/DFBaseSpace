//
//  UILabel+CrashType.m
//  GoodDoctor
//
//  Created by wanglai on 2020/6/13.
//  Copyright © 2020 litingting. All rights reserved.
//

#import "UILabel+CrashType.h"
#import <objc/runtime.h>

@implementation UILabel (CrashType)
+ (void)load {
    Method originalM = class_getInstanceMethod([self class], @selector(setText:));
    Method exchangeM = class_getInstanceMethod([self class], @selector(transeSetText:));
    method_exchangeImplementations(originalM, exchangeM);
}

- (void)transeSetText:(NSString *)title {
    if ([title isKindOfClass:[NSNumber class]]) {
        title = [NSString stringWithFormat:@"%@",title];
    }
    if ([title isEqualToString:@"(null)"]) {
        title = @"";
    }
    if ([title isEqualToString:@"null"]) {
        title = @"";
    }
    if ([title isKindOfClass:[NSNull class]]) {
        title = @"";
    }
    if (title == nil) {
        title = @"";
    }
    
    [self transeSetText:title];
}

@end
