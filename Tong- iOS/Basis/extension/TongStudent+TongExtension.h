//
//  TongStudent+TongExtension.h
//  Tong- iOS
//
//  Created by Tongle on 2021/5/31.
//

#import "TongStudent.h"

NS_ASSUME_NONNULL_BEGIN

/**
 1、为主类添加方法和属性
 2、所有方法和属性均为私有
 3、扩展中的方法要在主类中实现，不然会crash
 */
@interface TongStudent ()

@property (nonatomic, strong) NSString *address;

- (void)studyEveryDay;
@end

NS_ASSUME_NONNULL_END
