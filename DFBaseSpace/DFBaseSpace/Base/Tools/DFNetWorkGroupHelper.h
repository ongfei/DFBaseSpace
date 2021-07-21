//
//  DFNetWorkGroupHelper.h
//  GoodDoctor
//
//  Created by ongfei on 2020/11/27.
//  Copyright © 2020 litingting. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DFGroupHelperRequestModel : NSObject

@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSDictionary *para;

@end

@interface DFNetWorkGroupHelper : NSObject

+ (void)postWithList:(NSArray <DFGroupHelperRequestModel *> *)requestList
            complete:(void(^)(NSMutableDictionary *responsDic))complete
             failure:(void(^)(NSError *error))failure;

@end

NS_ASSUME_NONNULL_END
