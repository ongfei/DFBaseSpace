//
//  DFTool.h
//  GoodDoctor
//
//  Created by ongfei on 2020/5/9.
//  Copyright © 2020 litingting. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//#import "FLAnimatedImage.h"


typedef NS_ENUM(NSInteger, DFRadianDirection) {
    DFRadianDirectionBottom     = 0,
    DFRadianDirectionTop        = 1,
    DFRadianDirectionLeft       = 2,
    DFRadianDirectionRight      = 3,
};

NS_ASSUME_NONNULL_BEGIN

@interface DFTool : NSObject

+ (void)setCornerWithView:(UIView *)superView andRadius:(float)radius andRoundingCorners:(UIRectCorner)option;
+ (NSMutableAttributedString *)attributeStringForTopic:(NSString *)attr allStr:(NSString *)allStr color:(UIColor *)color;
+ (NSMutableAttributedString *)imgToAttributedString:(NSString *)imageName;
+ (NSMutableAttributedString *)imgToAttributedString:(NSString *)imageName imgframe:(CGRect)frame;
+ (NSMutableAttributedString *)getAttr:(NSString *)name image:(NSString *)imageName;
+ (NSMutableAttributedString *)getAttr:(NSString *)name image:(NSString *)imageName frame:(CGRect)frame;
+ (NSMutableAttributedString *)getBossAttr:(NSString *)name image:(NSString *)imageName;
//获取横线label
+ (NSMutableAttributedString *)getLineAttr:(NSString *)name color:(UIColor *)color font:(UIFont *)font;
+ (NSMutableAttributedString *)getAttr:(NSString *)title content:(NSString *)content lastContent:(NSString *)lastContent;
//计算文本的总行数
+ (NSInteger)rowsOfString:(NSString *)text withFont:(UIFont *)font withWidth:(CGFloat)width;
//view画大圆弧-订阅个人首页上面背景
+ (void)drawArcWithView:(UIView *)view radian:(CGFloat)radian direction:(DFRadianDirection)direction;

//获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentVC;

+ (void)updataSource;//更新本地数据
/// 设置行间距 首行缩进
+ (NSMutableAttributedString *)setAttibuteString:(NSString *)str LineSpacing:(CGFloat)lineSpacing firstLineHeadIndent:(CGFloat)firstLineHeadIndent attributes:(NSDictionary *)attributes;
/// 添加四边阴影效果
+ (void)addShadowToView:(UIView *)theView;

//+ (FLAnimatedImage *)getGifWithFilePathName:(NSString *)name;
/// 循环遍历设置高亮
+ (NSMutableAttributedString *)getHighLightStringWithTotalStr:(NSString *)totalString lightString:(NSString *)lightString LightColor:(UIColor *)color;
///<em>高亮</em> 正则匹配
+ (NSMutableAttributedString *)dealHighLightString:(NSString *)totalString LightColor:(UIColor *)color;
///是否为全空格
+ (BOOL)isAllSpace:(NSString *)str;
@end

NS_ASSUME_NONNULL_END
