//
//  DFBaseTableViewCell.m
//  GoodDoctor
//
//  Created by wanglai on 2020/5/6.
//  Copyright © 2020 litingting. All rights reserved.
//

#import "DFBaseTableViewCell.h"
#import <objc/runtime.h>

@implementation DFBaseTableViewCell

+ (instancetype)cellWithIdentifier:(NSString *)cellIdentifier {
    DFBaseTableViewCell *baseCell = [[objc_getClass(cellIdentifier.UTF8String) alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellIdentifier];
    return baseCell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

@end
