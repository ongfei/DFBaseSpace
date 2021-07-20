//
//  DFImgAndLableView.m
//  GoodDoctor
//
//  Created by wanglai on 2020/6/4.
//  Copyright © 2020 litingting. All rights reserved.
//

#import "DFImgAndLableView.h"

#import "masonry.h"

typedef enum : NSUInteger {
    CustomWithSize,
    CustomWithRate,
} CustomTpye;

@interface DFImgAndLableView ()

@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation DFImgAndLableView


- (instancetype)initWithImgDirection:(imgDirection)direction andOffset:(CGFloat)offset space:(CGFloat)space andImgRate:(ImgRate)rate andTextFont:(NSInteger)fontNumber andAlign:(NSTextAlignment)align {
    
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self prepareLayoutWithCustomTpye:CustomWithRate ImgDirection:direction andImgSize:CGSizeZero andOffset:offset space:space andImgRate:rate andTextFont:fontNumber andAlign:align];
    }
    
    return self;
}

- (instancetype)initWithImgDirection:(imgDirection)direction andOffset:(CGFloat)offset space:(CGFloat)space andImgSize:(CGSize)size andTextFont:(NSInteger)fontNumber andAlign:(NSTextAlignment)align {
    
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self prepareLayoutWithCustomTpye:CustomWithSize ImgDirection:direction andImgSize:size andOffset:offset space:space andImgRate:ImgRateMake(0, 0) andTextFont:fontNumber andAlign:align];
    }
    
    return self;
}

- (void)prepareLayoutWithCustomTpye:(CustomTpye)type ImgDirection:(imgDirection)direction andImgSize:(CGSize)size andOffset:(CGFloat)offset space:(CGFloat)space andImgRate:(ImgRate)rate andTextFont:(NSInteger)fontNumber andAlign:(NSTextAlignment)align {
    
    self.imgView = [UIImageView new];
//    self.imgView.userInteractionEnabled = NO;
    [self addSubview:self.imgView];
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        if (type == CustomWithRate) {
            
            make.width.equalTo(self.mas_width).multipliedBy(rate.ImgRatewidth);
            make.height.equalTo(self.mas_height).multipliedBy(rate.ImgRateheight);
            
        }else {
            
            make.width.mas_equalTo(size.width);
            make.height.mas_equalTo(size.height);
            
        }
        
        if (direction == imgDirectionTop || direction == imgDirectionBottom) {
            
            make.centerX.equalTo(self);
            
            if (direction == imgDirectionTop) {
                
                make.centerX.equalTo(self).offset(-offset);
                
            }else {
                
                make.centerX.equalTo(self).offset(-offset);
            }

        }else {
            if (direction == imgDirectionLeft) {
                
                make.centerY.equalTo(self).offset(-offset);
                
            }else {
                
                make.centerY.equalTo(self).offset(offset);
            }
        }
        
    }];
    
    
    self.textLabel = [UILabel new];
    self.textLabel.numberOfLines = 0;
    self.textLabel.font = [UIFont systemFontOfSize:fontNumber];
    self.textLabel.textAlignment = align;
    [self addSubview:self.textLabel];
    
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        switch (direction) {
            case imgDirectionTop: {
             
                make.top.equalTo(self.imgView.mas_bottom).offset(space);
                make.left.bottom.right.equalTo(self);
                
            }
                break;
            case imgDirectionLeft: {
                
//                make.centerY.equalTo(self.imgView.mas_centerY);
                make.left.equalTo(self.imgView.mas_right).offset(space);
                make.right.top.bottom.equalTo(self);
                
            }
                break;
            case imgDirectionBottom: {
                
                make.bottom.equalTo(self.imgView.mas_top).offset(space);
                make.left.top.right.equalTo(self);
                
            }
                break;
            case imgDirectionRight: {
                
//                make.centerY.equalTo(self.imgView.mas_centerY);
                make.right.equalTo(self.imgView.mas_left).offset(space);
                make.left.top.bottom.equalTo(self);
                
            }
                break;
   
            default:
                break;
        }
    }];
    
}

- (instancetype)initWithImgAbsoluteDirection:(imgDirection)direction space:(CGFloat)space andImgSize:(CGSize)size andTextFont:(NSInteger)fontNumber andAlign:(NSTextAlignment)align {
    if (self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
        
        self.imgView = [UIImageView new];
        [self addSubview:self.imgView];
        
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(size.width);
            make.height.mas_equalTo(size.height);
            
            if (direction == imgDirectionTop || direction == imgDirectionBottom) {
                
                make.centerX.equalTo(self);
                
                if (direction == imgDirectionTop) {
                    
                    make.top.equalTo(self).offset(space);
                    
                }else {
                    
                    make.bottom.equalTo(self).offset(-space);
                }
                
            }else {
                make.centerY.equalTo(self);
                if (direction == imgDirectionLeft) {
                    make.left.equalTo(self).offset(space);
                }else {
                    make.right.equalTo(self).offset(-space);
                }
            }
        }];
        
        
        self.textLabel = [UILabel new];
        self.textLabel.numberOfLines = 0;
        self.textLabel.font = [UIFont systemFontOfSize:fontNumber];
        self.textLabel.textAlignment = align;
        [self addSubview:self.textLabel];
        
        [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            switch (direction) {
                case imgDirectionTop: {
                    
                    make.top.equalTo(self.imgView.mas_bottom).offset(space);
                    make.left.bottom.right.equalTo(self);
                    
                }
                    break;
                case imgDirectionLeft: {
                    
                    make.left.equalTo(self.imgView.mas_right).offset(space);
                    make.right.top.bottom.equalTo(self);
                    
                }
                    break;
                case imgDirectionBottom: {
                    
                    make.bottom.equalTo(self.imgView.mas_top).offset(-space);
                    make.left.top.right.equalTo(self);
                    
                }
                    break;
                case imgDirectionRight: {
                    
                    make.right.equalTo(self.imgView.mas_left).offset(-space);
                    make.left.top.bottom.equalTo(self);
                    
                }
                    break;
                    
                default:
                    break;
            }
        }];

    }
    return self;
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    if(selected) {
        self.imgView.image = self.selectImage?self.selectImage:self.image;
        self.textLabel.textColor = self.textSelectColor?self.textSelectColor:self.textNomalColor;
    }else{
        self.imgView.image = self.image;
        self.textLabel.textColor = self.textNomalColor;
    }
}

- (void)setImage:(UIImage *)image {
    _image = image;
    self.imgView.image = self.image;
}

- (void)setSelectImage:(UIImage *)selectImage {
    _selectImage = selectImage;
}

- (void)setTextNomalColor:(UIColor *)textNomalColor {
    _textNomalColor = textNomalColor;
    self.textLabel.textColor = textNomalColor;
}

- (void)setTextSelectColor:(UIColor *)textSelectColor {
    _textSelectColor = textSelectColor;
}

@end
