//
//  BgGradientLayer.m
//  GoodDoctor
//
//  Created by wanglai on 2020/4/29.
//  Copyright © 2020 litingting. All rights reserved.
//

#import "BgGradientLayer.h"
//#import "UIColor+DF.h"

@implementation BgGradientLayer

+ (instancetype)sureBackgroundLayer {
    BgGradientLayer *bgLayer = [BgGradientLayer layer];
    bgLayer.startPoint = CGPointMake(0, 0);
    bgLayer.endPoint = CGPointMake(1, 1);
//    bgLayer.colors = @[(__bridge id)[UIColor dfColorWithHexString:@"#4285F5"].CGColor, (__bridge id)[UIColor dfColorWithHexString:@"#5ECCFF"].CGColor];
    bgLayer.locations = @[@(0), @(1.0f)];
    return bgLayer;
}

@end
