//
//  NSString+DFEmpty.m
//  GoodDoctor
//
//  Created by ongfei on 2020/9/2.
//  Copyright © 2020 litingting. All rights reserved.
//

#import "NSString+DFEmpty.h"

@implementation NSString (DFEmpty)

- (NSString *)filterEmpty {

    if ([[self class] isSubclassOfClass:[NSNull class]]) {
        return @"";
    }
    if (self == nil || self == NULL || [self isEqualToString:@"(null)"] || [self isEqualToString:@"null"]) {
        return @"";
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return @"";
    }
    if ([self isKindOfClass:[NSString class]] && [[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return @"";
    }
    return self;
}

@end
