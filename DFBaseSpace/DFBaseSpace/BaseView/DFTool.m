//
//  DFTool.m
//  GoodDoctor
//
//  Created by wanglai on 2020/5/9.
//  Copyright © 2020 litingting. All rights reserved.
//

#import "DFTool.h"
#import <CoreText/CoreText.h>

#define CELLIDADNMODELTYPE

@implementation DFTool

+ (void)setCornerWithView:(UIView *)superView andRadius:(float)radius andRoundingCorners:(UIRectCorner)option {
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:superView.bounds byRoundingCorners:option cornerRadii:CGSizeMake(radius, radius)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = superView.bounds;
    maskLayer.path = bezierPath.CGPath;
    superView.layer.mask = maskLayer;
}

+ (NSMutableAttributedString *)attributeStringForTopic:(NSString *)attr allStr:(NSString *)allStr color:(UIColor *)color {
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:allStr];
    [attrStr addAttribute:NSForegroundColorAttributeName
                      value:color
                      range:[allStr rangeOfString:attr]];
    return attrStr;
}

+ (NSMutableAttributedString *)getAttr:(NSString *)name image:(NSString *)imageName {
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    attch.image = [UIImage imageNamed:imageName];
    attch.bounds = CGRectMake(0, -3, 32, 18);
    NSAttributedString *string1 = [NSAttributedString attributedStringWithAttachment:attch];
    NSAttributedString *string2 = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@" %@",name]];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] init];
    [attr appendAttributedString:string1];
    [attr appendAttributedString:string2];
    
    return attr;
}

+ (NSMutableAttributedString *)imgToAttributedString:(NSString *)imageName {
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    attch.image = [UIImage imageNamed:imageName];
    attch.bounds = CGRectMake(0, -3, 32, 18);
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithAttributedString:[NSMutableAttributedString attributedStringWithAttachment:attch]];
    return attr;
}

+ (NSMutableAttributedString *)imgToAttributedString:(NSString *)imageName imgframe:(CGRect)frame {
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    attch.image = [UIImage imageNamed:imageName];
    attch.bounds = frame;
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithAttributedString:[NSMutableAttributedString attributedStringWithAttachment:attch]];
    return attr;
}

+ (NSMutableAttributedString *)getAttr:(NSString *)name image:(NSString *)imageName frame:(CGRect)frame {
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    attch.image = [UIImage imageNamed:imageName];
    attch.bounds = frame;
    NSAttributedString *string1 = [NSAttributedString attributedStringWithAttachment:attch];
    NSAttributedString *string2 = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@" %@",name]];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] init];
    [attr appendAttributedString:string1];
    [attr appendAttributedString:string2];
    
    return attr;
}

+ (NSAttributedString *)getBossAttr:(NSString *)name image:(NSString *)imageName{
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    attch.image = [UIImage imageNamed:imageName];
    attch.bounds = CGRectMake(0, -3, 60, 15);
    NSAttributedString *string1 = [NSAttributedString attributedStringWithAttachment:attch];
    NSAttributedString *string2 = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@" %@",name]];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] init];
    [attr appendAttributedString:string1];
    [attr appendAttributedString:string2];
    
    return attr;
}
//获取横线label
+ (NSAttributedString *)getLineAttr:(NSString *)name color:(UIColor *)color font:(UIFont *)font {

    NSDictionary *contentdictAttr =@{
                                     NSForegroundColorAttributeName:color,
                                     NSFontAttributeName:font,
                                     NSStrikethroughStyleAttributeName : @(1),
                                     NSBaselineOffsetAttributeName : @(NSUnderlineStyleSingle)

                                     };
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:name attributes:contentdictAttr];

    return attr;
}
+ (NSAttributedString *)getAttr:(NSString *)title content:(NSString *)content lastContent:(NSString *)lastContent {
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",title]];
    
    NSDictionary *contentdictAttr =@{
                              NSFontAttributeName:[UIFont boldSystemFontOfSize:15]
                              };
    
    NSAttributedString *conStr = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",content] attributes:contentdictAttr];
    
    [attr appendAttributedString:conStr];
    if (lastContent) {
        NSMutableAttributedString *lastAttr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",lastContent]];
        [attr appendAttributedString:lastAttr];
    }
    return attr;
}

//计算文本的总行数
+ (NSInteger)rowsOfString:(NSString *)text withFont:(UIFont *)font withWidth:(CGFloat)width {
    if (!text || text.length == 0) {
        return 0;
    }
    CTFontRef myFont = CTFontCreateWithName(( CFStringRef)([font fontName]), [font pointSize], NULL);
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];
    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge  id)myFont range:NSMakeRange(0, attStr.length)];
    CFRelease(myFont);
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString(( CFAttributedStringRef)attStr);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0,0,width,MAXFLOAT));
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    NSArray *lines = ( NSArray *)CTFrameGetLines(frame);
    return lines.count;
}
/// 设置行间距 首行缩进
+ (NSMutableAttributedString *)setAttibuteString:(NSString *)str LineSpacing:(CGFloat)lineSpacing firstLineHeadIndent:(CGFloat)firstLineHeadIndent attributes:(NSDictionary *)attributes {
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineSpacing = lineSpacing;// 字体的行间距
    paragraph.firstLineHeadIndent = firstLineHeadIndent;//首行缩进
    NSMutableDictionary *att = [NSMutableDictionary dictionaryWithDictionary:attributes];
    [att setValue:paragraph forKey:NSParagraphStyleAttributeName];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str attributes:att];
    return attrStr;
}


+ (void)drawArcWithView:(UIView *)view radian:(CGFloat)radian direction:(DFRadianDirection)direction {
   if(radian == 0) return;
    CGFloat t_width = CGRectGetWidth(view.frame); // 宽
    CGFloat t_height = CGRectGetHeight(view.frame); // 高
    CGFloat height = fabs(radian); // 圆弧高度
    CGFloat x = 0;
    CGFloat y = 0;
    
    // 计算圆弧的最大高度
    CGFloat _maxRadian = 0;
    switch (direction) {
        case DFRadianDirectionBottom:
        case DFRadianDirectionTop:
            _maxRadian =  MIN(t_height, t_width / 2);
            break;
        case DFRadianDirectionLeft:
        case DFRadianDirectionRight:
            _maxRadian =  MIN(t_height / 2, t_width);
            break;
        default:
            break;
    }
    if(height > _maxRadian){
        NSLog(@"圆弧半径过大, 跳过设置。");
        return;
    }
    
    // 计算半径
    CGFloat radius = 0;
    switch (direction) {
        case DFRadianDirectionBottom:
        case DFRadianDirectionTop:
        {
            CGFloat c = sqrt(pow(t_width / 2, 2) + pow(height, 2));
            CGFloat sin_bc = height / c;
            radius = c / ( sin_bc * 2);
        }
            break;
        case DFRadianDirectionLeft:
        case DFRadianDirectionRight:
        {
            CGFloat c = sqrt(pow(t_height / 2, 2) + pow(height, 2));
            CGFloat sin_bc = height / c;
            radius = c / ( sin_bc * 2);
        }
            break;
        default:
            break;
    }
    
    // 画圆
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setFillColor:[[UIColor whiteColor] CGColor]];
    CGMutablePathRef path = CGPathCreateMutable();
    switch (direction) {
        case DFRadianDirectionBottom:
        {
            if(radian > 0){
                CGPathMoveToPoint(path,NULL, t_width,t_height - height);
                CGPathAddArc(path,NULL, t_width / 2, t_height - radius, radius, asin((radius - height ) / radius), M_PI - asin((radius - height ) / radius), NO);
            }else{
                CGPathMoveToPoint(path,NULL, t_width,t_height);
                CGPathAddArc(path,NULL, t_width / 2, t_height + radius - height, radius, 2 * M_PI - asin((radius - height ) / radius), M_PI + asin((radius - height ) / radius), YES);
            }
            CGPathAddLineToPoint(path,NULL, x, y);
            CGPathAddLineToPoint(path,NULL, t_width, y);
        }
            break;
        case DFRadianDirectionTop:
        {
            if(radian > 0){
                CGPathMoveToPoint(path,NULL, t_width, height);
                CGPathAddArc(path,NULL, t_width / 2, radius, radius, 2 * M_PI - asin((radius - height ) / radius), M_PI + asin((radius - height ) / radius), YES);
            }else{
                CGPathMoveToPoint(path,NULL, t_width, y);
                CGPathAddArc(path,NULL, t_width / 2, height - radius, radius, asin((radius - height ) / radius), M_PI - asin((radius - height ) / radius), NO);
            }
            CGPathAddLineToPoint(path,NULL, x, t_height);
            CGPathAddLineToPoint(path,NULL, t_width, t_height);
        }
            break;
        case DFRadianDirectionLeft:
        {
            if(radian > 0){
                CGPathMoveToPoint(path,NULL, height, y);
                CGPathAddArc(path,NULL, radius, t_height / 2, radius, M_PI + asin((radius - height ) / radius), M_PI - asin((radius - height ) / radius), YES);
            }else{
                CGPathMoveToPoint(path,NULL, x, y);
                CGPathAddArc(path,NULL, height - radius, t_height / 2, radius, 2 * M_PI - asin((radius - height ) / radius), asin((radius - height ) / radius), NO);
            }
            CGPathAddLineToPoint(path,NULL, t_width, t_height);
            CGPathAddLineToPoint(path,NULL, t_width, y);
        }
            break;
        case DFRadianDirectionRight:
        {
            if(radian > 0){
                CGPathMoveToPoint(path,NULL, t_width - height, y);
                CGPathAddArc(path,NULL, t_width - radius, t_height / 2, radius, 1.5 * M_PI + asin((radius - height ) / radius), M_PI / 2 + asin((radius - height ) / radius), NO);
            }else{
                CGPathMoveToPoint(path,NULL, t_width, y);
                CGPathAddArc(path,NULL, t_width  + radius - height, t_height / 2, radius, M_PI + asin((radius - height ) / radius), M_PI - asin((radius - height ) / radius), YES);
            }
            CGPathAddLineToPoint(path,NULL, x, t_height);
            CGPathAddLineToPoint(path,NULL, x, y);
        }
            break;
        default:
            break;
    }
    
    CGPathCloseSubpath(path);
    [shapeLayer setPath:path];
    CFRelease(path);
    view.layer.mask = shapeLayer;
}

//获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentVC {
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    
    if ([currentVC isKindOfClass:[UIAlertController class]]) {
        
        UIViewController *rootVC = [[[UIApplication sharedApplication] windows] lastObject].rootViewController;
        if ([rootVC isKindOfClass:[UITabBarController class]]) {
            UITabBarController *tabViewController  = (UITabBarController *)rootVC;
            if (tabViewController.viewControllers.count <= tabViewController.selectedIndex) {
                return nil;
            }
            UINavigationController *nav  = (UINavigationController *)tabViewController.viewControllers[tabViewController.selectedIndex];
            return nav.viewControllers.lastObject;
        }else if ([rootVC isKindOfClass:[UINavigationController class]]) {
            UINavigationController *nav = (UINavigationController *)rootVC;
            return nav.viewControllers.lastObject;
        }
    }
    
    return currentVC;
}

+ (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC {
    UIViewController *currentVC;
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        rootVC = [rootVC presentedViewController];
    }
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        // 根视图为非导航类
        currentVC = rootVC;
    }
    return currentVC;
}

/// 添加四边阴影效果
+ (void)addShadowToView:(UIView *)theView {
        // 阴影颜色
    theView.layer.shadowColor = [UIColor blackColor].CGColor;
        // 阴影偏移，默认(0, -3)
    theView.layer.shadowOffset = CGSizeMake(0,0);
        // 阴影透明度，默认0
    theView.layer.shadowOpacity = 0.1;
        // 阴影半径，默认3
    theView.layer.shadowRadius = 6;
    
    theView.layer.masksToBounds = NO;
    
}

//+ (FLAnimatedImage *)getGifWithFilePathName:(NSString *)name {
//    if ([name containsString:@".gif"]) {
//        return [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:nil]]];
//    }
//    return  [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:@"gif"]]];
//}

+ (NSMutableAttributedString *)getHighLightStringWithTotalStr:(NSString *)totalString lightString:(NSString *)lightString LightColor:(UIColor *)color {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:totalString];
    NSString *copyTotalString = totalString;
    NSMutableString *replaceString = [NSMutableString stringWithString:@" "];
    for (int i = 0; i < lightString.length; i ++) {
        NSString *singleString = [lightString substringWithRange:NSMakeRange(i, 1)];
        if (![singleString isEqualToString:@" "]) {
            while ([copyTotalString rangeOfString:singleString].location != NSNotFound) {
                NSRange range = [copyTotalString rangeOfString:singleString];
                [attributedString addAttribute:NSForegroundColorAttributeName value:color range:range];
                copyTotalString = [copyTotalString stringByReplacingCharactersInRange:range withString:replaceString];
            }
        }
    }
    return attributedString;
}
///<em>高亮</em>
+ (NSMutableAttributedString *)dealHighLightString:(NSString *)totalString LightColor:(UIColor *)color {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:totalString];

    NSError* error = NULL;
    NSRegularExpression *reg = [NSRegularExpression regularExpressionWithPattern:@"<em>.+?</em>" options:0 error:&error];
    
    NSArray* match = [reg matchesInString:totalString options:NSMatchingReportCompletion range:NSMakeRange(0, [totalString length])];
    
    for (NSTextCheckingResult *matc in match) {
        NSRange range = [matc range];
        
        NSString *newStr = [[[totalString substringWithRange:range] stringByReplacingOccurrencesOfString:@"<em>" withString:@""] stringByReplacingOccurrencesOfString:@"</em>" withString:@""];
        //换标签这里9要换成标签的总长度
        NSInteger loca = range.location - ([match indexOfObject:matc] * 9);
        
        [attributedString replaceCharactersInRange:NSMakeRange(loca, range.length) withString:newStr];
        [attributedString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(loca, newStr.length)];
    }
    
    return attributedString;
}


+ (NSMutableAttributedString *)dealHighLightString2:(NSString *)totalString LightColor:(UIColor *)color {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
    NSArray *sepArr = [totalString componentsSeparatedByString:@"<em>"];
    
    for (NSString *sourceStr in sepArr) {
        if ([sourceStr containsString:@"</em>"]) {
            
            NSError* error = NULL;
            NSRegularExpression *reg = [NSRegularExpression regularExpressionWithPattern:@".+?</em>" options:0 error:&error];
            
            NSArray* match = [reg matchesInString:sourceStr options:NSMatchingReportCompletion range:NSMakeRange(0, [sourceStr length])];
            
            for (NSTextCheckingResult *matc in match) {
                NSRange range = [matc range];
                NSString *newStr = [sourceStr stringByReplacingOccurrencesOfString:@"</em>" withString:@""];
                
                NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:newStr];
                //5 指 </em>的长度
                [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, range.length - 5)];
                
                [attributedString appendAttributedString:attributedStr];
            }
        }else {
            [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:sourceStr]];
        }
        
    }
    
    return attributedString;
}

+ (BOOL)isAllSpace:(NSString *)str {
    if (!str) {
        return true;
    } else {
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimedString = [str stringByTrimmingCharactersInSet:set];
        if ([trimedString length] == 0) {
            return true;
        } else {
            return false;
        }
    }
}


@end
