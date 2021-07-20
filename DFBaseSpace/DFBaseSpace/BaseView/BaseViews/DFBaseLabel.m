//
//  DFBaseLabel.m
//  GoodDoctor
//
//  Created by wanglai on 2020/4/29.
//  Copyright © 2020 litingting. All rights reserved.
//

#import "DFBaseLabel.h"

@implementation DFBaseLabel

+ (instancetype)customWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color textAlignment:(NSTextAlignment)textAlignment {
    DFBaseLabel *label = [DFBaseLabel new];
    label.text = text;
    label.font = font;
    label.textColor = color;
    label.textAlignment = textAlignment;
    label.ceiling = VerticalAlignmentNone;
    return label;
}

- (instancetype)init {
    if (self = [super init]) {
        _edgeInsets = UIEdgeInsetsZero;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _edgeInsets = UIEdgeInsetsZero;
    }
    return self;
}

- (void)setCeiling:(VerticalAlignment)ceiling {
    _ceiling = ceiling;
    [self setNeedsLayout];
}

- (void)drawTextInRect:(CGRect)rect {
    if (self.ceiling!=VerticalAlignmentNone) {
        CGRect actualRect = [self textRectForBounds:rect limitedToNumberOfLines:self.numberOfLines];
        [super drawTextInRect:actualRect];
    }else {
        [super drawTextInRect:UIEdgeInsetsInsetRect(rect, UIEdgeInsetsZero)];
    }
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    if (self.ceiling!=VerticalAlignmentNone) {
        CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
        switch (self.ceiling) {
            case VerticalAlignmentTop:
                textRect.origin.y = bounds.origin.y;
                break;
            case VerticalAlignmentBottom:
                textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
                break;
            case VerticalAlignmentMiddle:
                    // Fall through.
            default:
                textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
        }
        return textRect;
    }else {
        CGRect Rect =   [super textRectForBounds:UIEdgeInsetsInsetRect(bounds, _edgeInsets) limitedToNumberOfLines:numberOfLines];
        Rect.origin.x += self.edgeInsets.left;
        Rect.origin.y += self.edgeInsets.top;
        Rect.size.width += self.edgeInsets.left + self.edgeInsets.right;
        Rect.size.height += self.edgeInsets.top + self.edgeInsets.bottom;
        return Rect;
    }
}

@end
