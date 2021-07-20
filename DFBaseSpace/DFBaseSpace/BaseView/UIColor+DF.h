//
//  UIColor+DF.h
//  GoodDoctor
//
//  Created by wanglai on 2020/4/29.
//  Copyright © 2020 litingting. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kRandomColor [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0]

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (DF)
/// 十六进制字符串获取颜色
/// @param color 16进制色值  支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)dfColorWithHexString:(NSString *)color;

/// 十六进制字符串获取颜色
/// @param color 16进制色值  支持@“#123456”、 @“0X123456”、 @“123456”三种格式
/// @param alpha 透明度
+ (UIColor *)dfColorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

/// 适配暗黑模式颜色   传入的UIColor对象
/// @param lightColor 普通模式颜色
/// @param darkColor 暗黑模式颜色
+ (UIColor *)dfColorWithLightColor:(UIColor *)lightColor DarkColor:(UIColor *)darkColor;

/// 适配暗黑模式颜色   颜色传入的是16进制字符串
/// @param lightColor 普通模式颜色
/// @param darkColor 暗黑模式颜色
+ (UIColor *)dfColorWithLightColorStr:(NSString *)lightColor DarkColor:(NSString *)darkColor;

/// 适配暗黑模式颜色   颜色传入的是16进制字符串 还有颜色的透明度
/// @param lightColor 普通模式颜色
/// @param lightAlpha 普通模式颜色透明度
/// @param darkColor 暗黑模式颜色透明度
/// @param darkAlpha 暗黑模式颜色
+ (UIColor *)dfColorWithLightColorStr:(NSString *)lightColor WithLightColorAlpha:(CGFloat)lightAlpha DarkColor:(NSString *)darkColor WithDarkColorAlpha:(CGFloat)darkAlpha;
@end

NS_ASSUME_NONNULL_END
