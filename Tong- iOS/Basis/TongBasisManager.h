//
//  TongBasisClass.h
//  Tong- iOS
//
//  Created by Tongle on 2021/6/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TongBasisManager : NSObject

/**
 load和initialize的区别
 异、load方法无论类有没有用到，只要被引入项目，启动项目就会被调用（过多load会影响启动速度），initailize只有这个类或其子类主动去调用
 load调用时机比较早,当load调用时,其他类可能还没加载完成,运行环境不安全.
 load方法是线程安全的，它使用了锁，我们应该避免线程阻塞在load方法.
 initialize内部也使用了锁，所以是线程安全的。但同时要避免阻塞线程，不要再使用锁
 
 同、如果父类和子类都被调用,父类的调用一定在子类之前
 */
+ (void)load;
+ (void)initialize;

@end

NS_ASSUME_NONNULL_END
