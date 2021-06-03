//
//  TongProtocolJumping.m
//  Tong- iOS
//
//  Created by tong on 2021/6/1.
//

#import "TongProtocolJumping.h"

@implementation TongProtocolJumping

+ (NSDictionary *)shareCache{
    static NSMutableDictionary *dic;
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        dic = @{}.mutableCopy;
    });
    return dic;
}

+ (void)registerProtocol:(Protocol *)protocol cla:(Class)cla{
    [[TongProtocolJumping shareCache] setValue:cla forKey:NSStringFromProtocol(protocol)];
}

+ (UIViewController *)jumpingViewControllerWithProtocol:(Protocol *)protocol withParams:(nonnull NSDictionary *)params{
    Class cls = [[TongProtocolJumping shareCache] objectForKey:NSStringFromProtocol(protocol)];
    return [[cls alloc] jumpingViewControllerWithParams:params];
}



@end
