//
//  DFBaseImageView.m
//  GoodDoctor
//
//  Created by ongfei on 2020/5/8.
//  Copyright © 2020 litingting. All rights reserved.
//

#import "DFBaseImageView.h"

@implementation DFBaseImageView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.contentMode = UIViewContentModeScaleToFill;
        self.userInteractionEnabled = YES;
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)setImage:(UIImage *)image {
    [super setImage:image];
    self.backgroundColor = [UIColor clearColor];
}


@end
