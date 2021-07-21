//
//  DFBaseCollectionViewCell.h
//  GoodDoctor
//
//  Created by ongfei on 2021/1/5.
//  Copyright © 2021 litingting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DFBaseLabel.h" 

NS_ASSUME_NONNULL_BEGIN

@interface DFBaseCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) DFBaseLabel *contentLabel;

@end

NS_ASSUME_NONNULL_END
