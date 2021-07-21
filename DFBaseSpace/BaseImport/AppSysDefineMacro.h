//
//  AppSysDefineMacro.h
//  DFBaseSpace
//
//  Created by ongfei
//

#ifndef AppSysDefineMacro_h
#define AppSysDefineMacro_h

#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

#define kSafeAreaInsets [UIApplication sharedApplication].keyWindow.safeAreaInsets
#define kStateFrame  [UIApplication sharedApplication].statusBarFrame
#define kNavHeight  (kStateFrame.size.height > 20 ?  ([UIApplication sharedApplication].statusBarFrame.size.height+44) : 64)
#define kTabbarHeight  (kStateFrame.size.height > 20 ?  83 : 49)
#define kDfBlock(s)  __block __weak typeof(s) dfBlock = s;
#define ColorFromRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
//#define kImagePath(name) [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:name]

#pragma mark -------------------------------------instance--------------------------------------
#define kShareInstance  + (instancetype)shareInstance;

#define kShareInstanceImplement(class) \
\
static class *_shareInstance; \
\
+ (instancetype)shareInstance { \
\
if(_shareInstance == nil) {\
_shareInstance = [[class alloc] init]; \
} \
return _shareInstance; \
} \
\
+(instancetype)allocWithZone:(struct _NSZone *)zone { \
\
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_shareInstance = [super allocWithZone:zone]; \
}); \
\
return _shareInstance; \
\
}


#pragma mark -------------------------------------<##>Adapt---------------------------------------------------------------
#define  adjustsScrollViewInsets_NO(scrollView,vc)\
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
if ([UIScrollView instancesRespondToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
[scrollView performSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:") withObject:@(2)];\
} else {\
vc.automaticallyAdjustsScrollViewInsets = NO;\
}\
_Pragma("clang diagnostic pop") \
} while (0)



#endif /* AppSysDefineMacro_h */
