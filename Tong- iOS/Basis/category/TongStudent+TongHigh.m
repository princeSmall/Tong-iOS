//
//  TongStudent+TongHigh.m
//  Tong- iOS
//
//  Created by PrinceSmall on 2021/5/31.
//

#import "TongStudent+TongHigh.h"
#import <objc/runtime.h>


/**
 1. 由于分类的结构体中没有存放成员变量的数组，所以其无法创建和使用成员变量，但是我们可以通过runtime的API
 objc_setAssociatedObject ，objc_getAssociatedObject
 为分类在运行时添加实例变量
 
  2. 为主类提取代码，实现不同类别的不同方法
 */


@implementation TongStudent (TongHigh)

// 添加属性name
- (void)setName:(NSString *)name{
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

// 获取属性name
- (NSString *)name{
    return objc_getAssociatedObject(self, @"name");
}

- (void)gotoHightSchoolEveryData{
    [self gotoSchoolEveryDay:YES];
    NSLog(@"gotoHightSchoolEveryData");
}

@end
