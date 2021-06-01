//
//  TongTargetJumping.m
//  Tong- iOS
//
//  Created by tong on 2021/6/1.
//

#import "TongTargetJumping.h"

@implementation TongTargetJumping


//    硬编码，通过runtime和反射获取跳转类和方法赋值
//    如果类太多，导致Mediator会很臃肿，通过扩展mediator处理
//    传递的参数performSelector有限制

+ (UIViewController *)targetViewController:(NSString *)targetUrl{
    Class cls = NSClassFromString(@"TongJumpingToViewController");
    SEL selector = NSSelectorFromString(@"initWithUrl:");
    UIViewController *viewController = [[cls alloc] performSelector:selector withObject:targetUrl];
    return viewController;
}

@end
