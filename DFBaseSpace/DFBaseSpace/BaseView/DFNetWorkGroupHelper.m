//
//  DFNetWorkGroupHelper.m
//  GoodDoctor
//
//  Created by ongfei on 2020/11/27.
//  Copyright © 2020 litingting. All rights reserved.
//

#import "DFNetWorkGroupHelper.h"

@implementation DFGroupHelperRequestModel

- (NSDictionary *)para {
    if (_para == nil) {
        return @{};
    }else {
        return _para;
    }
}

@end

@implementation DFNetWorkGroupHelper

+ (void)postWithList:(NSArray <DFGroupHelperRequestModel *> *)requestList
            complete:(void(^)(NSMutableDictionary *responsDic))complete
             failure:(void(^)(NSError *error))failure {
    
    dispatch_group_t group =  dispatch_group_create();
    NSError *error = nil;
    NSMutableDictionary *responsDic = [NSMutableDictionary dictionary];
    for (DFGroupHelperRequestModel *model in requestList) {
        dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            dispatch_group_enter(group);
//            [NetworkHelper POST:model.url baseUrl:appServer method:@"" showHud:NO hudEnable:NO showError:NO parameters:model.para success:^(id  _Nonnull responseObject) {
//
//                [responsDic setValue:responseObject forKey:model.url];
//                dispatch_group_leave(group);
//
//               } failure:^(NSError * _Nonnull error) {
//                   dispatch_group_leave(group);
//                   error = error;
//               }];
        });
    }
     
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        complete(responsDic);
        failure(error);
    });
}

@end
