//
//  TongNotificationCenter.h
//  Tong- iOS
//
//  Created by PrinceSmall on 2021/6/1.
//

#import <Foundation/Foundation.h>

/**
 观察者模式：传递方式一对多
 当两个类没有关联时，并且响应数据改变时，使用通知
 在dealloc中移除通知，避免内存泄漏
 */
NS_ASSUME_NONNULL_BEGIN

@interface TongNotificationCenter : NSObject

- (void)postNotification;

@end

NS_ASSUME_NONNULL_END
