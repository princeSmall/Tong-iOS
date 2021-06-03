//
//  TongUrlJumping.m
//  Tong- iOS
//
//  Created by tong on 2021/6/1.
//

#import "TongUrlJumping.h"

@implementation TongUrlJumping


// 创建单利的缓存对象

+ (NSDictionary *)shareCache{
    static NSMutableDictionary *dic;
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        dic = @{}.mutableCopy;
    });
    return dic;
}

+ (void)registerScheme:(NSString *)scheme jumpingBlock:(urlJumpingBlock)block{
    if (scheme && block) {
        [[TongUrlJumping shareCache] setValue:block forKey:scheme];
    }
}

+ (void)openUrl:(NSString *)url params:(NSDictionary *)params{
    urlJumpingBlock block = [[TongUrlJumping shareCache] objectForKey:url];
    if (url) {
        block(params);
    }
}

@end
