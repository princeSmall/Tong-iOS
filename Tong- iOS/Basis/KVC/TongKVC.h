//
//  TongKVC.h
//  Tong- iOS
//
//  Created by Tongle on 2021/6/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/**
 KVC(Key-value coding）：

 1、键值对编码，也就是我们可以通过变量的名称来读取或者修改它的值，而不需要调用明确的存取方法。这样就可以在运行时动态地访问和修改对象的属性。
 而不是在编译时确定。对于类里的私有属性，Objective-C是无法直接访问的，但是KVC是可以的。
 2.、KVC+Runtime  字典转模型
 */

@interface TongKVC : NSObject


@end

NS_ASSUME_NONNULL_END
