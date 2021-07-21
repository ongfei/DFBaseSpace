//
//  DFBaseCollectionViewCell.m
//  GoodDoctor
//
//  Created by ongfei on 2021/1/5.
//  Copyright © 2021 litingting. All rights reserved.
//

#import "DFBaseCollectionViewCell.h"
#import "Masonry.h"

@implementation DFBaseCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.contentLabel = [DFBaseLabel customWithText:@"" font:[UIFont systemFontOfSize:13] textColor:[UIColor blackColor] textAlignment:(NSTextAlignmentLeft)];
        [self.contentView addSubview:self.contentLabel];
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }
    return self;
}

@end
