//
//  DFBaseTableViewCell.h
//  GoodDoctor
//
//  Created by ongfei on 2020/5/6.
//  Copyright © 2020 litingting. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DFBaseTableViewCell : UITableViewCell

@property (nonatomic, strong) id model;
///cellIdentifier cell类名
+ (instancetype)cellWithIdentifier:(NSString *)cellIdentifier;

@end

NS_ASSUME_NONNULL_END
