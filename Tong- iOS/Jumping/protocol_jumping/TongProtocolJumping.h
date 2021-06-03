//
//  TongProtocolJumping.h
//  Tong- iOS
//
//  Created by tong on 2021/6/1.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/**
 协议跳转
 需要load先注册，需要遵守协议，不完全节藕
 */

@protocol jumpingProtocol <NSObject>

- (UIViewController *)jumpingViewControllerWithParams:(NSDictionary *)params;

@end

@interface TongProtocolJumping : NSObject

+ (void)registerProtocol:(Protocol *)protocol cla:(Class)cla;

+ (UIViewController *)jumpingViewControllerWithProtocol:(Protocol *)protocol withParams:(NSDictionary *)params;


@end

NS_ASSUME_NONNULL_END
