//
//  DFBaseModel.h
//  GoodDoctor
//
//  Created by wanglai on 2020/5/7.
//  Copyright © 2020 litingting. All rights reserved.
//

#import <Foundation/Foundation.h>

//#define kMJ_replacedDic \
//({\
//NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:@{@"pageCount" : @"result.pageCount",@"amount" : @"result.amount",@"countPerPage" : @"result.countPerPage",@"currentPage" : @"result.currentPage",@"totalPages" : @"result.totalPages"}];\
//(dict);\
//})\


NS_ASSUME_NONNULL_BEGIN

@class DFBaseResponseStatus;
@interface DFBaseModel : NSObject

@property (nonatomic, strong) id result;
@property (nonatomic, strong) DFBaseResponseStatus *status;
@property (nonatomic, assign) NSInteger pageCount;
@property (nonatomic, assign) NSInteger amount;
@property (nonatomic, assign) NSInteger countPerPage;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, assign) NSInteger totalPages;

@end

@interface DFBaseResponseModel : NSObject

@property (nonatomic, assign) NSInteger pageCount;
@property (nonatomic, assign) NSInteger amount;
@property (nonatomic, assign) NSInteger countPerPage;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, assign) NSInteger totalPages;

@end

@interface DFBaseResponseStatus : NSObject

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *systemTime;

@end

NS_ASSUME_NONNULL_END
