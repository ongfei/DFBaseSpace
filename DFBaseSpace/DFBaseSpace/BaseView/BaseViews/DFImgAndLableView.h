////
////  DFImgAndLableView.h
////  GoodDoctor
////
////  Created by wanglai on 2020/6/4.
////  Copyright © 2020 litingting. All rights reserved.
////
//
//#import <UIKit/UIKit.h>
//
//NS_ASSUME_NONNULL_BEGIN
//
//typedef enum : NSUInteger {
//    imgDirectionTop,
//    imgDirectionLeft,
//    imgDirectionBottom,
//    imgDirectionRight,
//} imgDirection;
//
//
//struct ImgRate {
//    CGFloat ImgRatewidth;
//    CGFloat ImgRateheight;
//};
//
//typedef struct ImgRate ImgRate;
//
//CG_INLINE ImgRate
//ImgRateMake(CGFloat widthRate, CGFloat heightRate)
//{
//    ImgRate rate;
//    rate.ImgRatewidth = widthRate;
//    rate.ImgRateheight = heightRate;
//    return rate;
//}
//
//
//@interface DFImgAndLableView : UIControl
//
//@property (nonatomic, strong) UILabel *textLabel;
//
//@property (nonatomic, strong) UIImage *image;
//@property (nonatomic, strong) UIImage *selectImage;
//
//@property (nonatomic, strong) UIColor *textSelectColor;
//@property (nonatomic, strong) UIColor *textNomalColor;
//
///**
// 初始化
// @param direction 图片方向
// @param offset 偏移量
// @param rate 图片相对父视图的比率
// @param fontNumber label大小
// @param align lable对齐方式
// */
//- (instancetype)initWithImgDirection:(imgDirection)direction andOffset:(CGFloat)offset space:(CGFloat)space andImgRate:(ImgRate)rate andTextFont:(NSInteger)fontNumber andAlign:(NSTextAlignment)align;
///**
// 初始化
// @param direction 图片方向
// @param offset 偏移量
// @param rate 图片frame
// @param fontNumber label大小
// @param align lable对齐方式
// */
//- (instancetype)initWithImgDirection:(imgDirection)direction andOffset:(CGFloat)offset space:(CGFloat)space andImgSize:(CGSize)size andTextFont:(NSInteger)fontNumber andAlign:(NSTextAlignment)align;
///*
// 
// @param direction 固定位置图片位置
// @param space 边距
// @param size 图片size
// @param fontNumber label大小
// @param align lable对齐方式
// */
//- (instancetype)initWithImgAbsoluteDirection:(imgDirection)direction space:(CGFloat)space andImgSize:(CGSize)size andTextFont:(NSInteger)fontNumber andAlign:(NSTextAlignment)align;
//@end
//
//NS_ASSUME_NONNULL_END
