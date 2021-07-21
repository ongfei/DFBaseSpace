//
//  DFBaseLabel.h
//  GoodDoctor
//
//  Created by wanglai on 2020/4/29.
//  Copyright © 2020 litingting. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    VerticalAlignmentNone,
    VerticalAlignmentTop,
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;


@interface DFBaseLabel : UILabel

@property (nonatomic,assign) UIEdgeInsets edgeInsets;
@property (nonatomic, assign) VerticalAlignment ceiling;

+ (instancetype)customWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color textAlignment:(NSTextAlignment)textAlignment;

@end

NS_ASSUME_NONNULL_END
