//
//  TongBlock.h
//  Tong- iOS
//
//  Created by PrinceSmall on 2021/6/1.
//

#import <Foundation/Foundation.h>

/**
 block三种方式：
 全局区block：不获取任何外部变量，内存在编译时就确定
 堆区block：copy 到堆内存空间上，可以在定义的范围外使用
 栈区block：MRC下，栈内有效，出栈销毁
 
  block本质是一个oc对象，内部与欧一个isa指针，block是封装了函数调用以及函数调用环境的oc对象
 isa: 指向所属类的指针，也就是block的类型
 flags: 标志变量，在实现block的内部操作时会用到
 Reserved: 保留变量
 invoke: block执行时调用的函数指针，block内部的执行代码都在这个函数中
 descriptor: block的详细描述，包含 copy/dispose 函数，处理block引用外部变量时使用
         reserved: 保留变量
         size: block的内存大小
         copy: 拷贝block中被 __block 修饰的外部变量
         dispose: 和 copy 方法配置应用，用来释放资源
 variables: block范围外的变量，如果block没有调用任何外部变量，该变量就不存在


 */

typedef void(^TongCommonBlock)(NSString * _Nullable name, NSInteger age);

NS_ASSUME_NONNULL_BEGIN

@interface TongBlock : NSObject

@property (nonatomic, strong)NSString *name;

@property (nonatomic, copy)TongCommonBlock commonBlock;

+ (void)load;

+ (instancetype)shareManager;

// 两个不同方式定义方法内block
- (void)commonName:(NSString *)name block:(TongCommonBlock)block;

- (void)commonNameDiff:(NSString *)name block:(void(^)(NSString *name, NSInteger age))block;

@end

NS_ASSUME_NONNULL_END
