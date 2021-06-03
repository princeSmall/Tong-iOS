//
//  TongUrlJumping.h
//  Tong- iOS
//
//  Created by tong on 2021/6/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 最开始的时候就要先注册好要跳转的控制器
 根据scheme选择跳转的控制器
 load影响启动速度，都要导入jumping类，耦合程度高
 */

typedef void(^urlJumpingBlock)(NSDictionary *params);

@interface TongUrlJumping : NSObject

+ (void)registerScheme:(NSString *)scheme jumpingBlock:(urlJumpingBlock)block;

+ (void)openUrl:(NSString *)url params:(NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
