//
//  TongBlock.m
//  Tong- iOS
//
//  Created by Tongle on 2021/6/1.
//

#import "TongBlock.h"

@implementation TongBlock

+ (instancetype)shareManager{
    static TongBlock *block;
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        block = [[TongBlock alloc]init];
    });
    return block;
}

+ (void)load{
    [[TongBlock shareManager] argcBlock];
}

/**
 1、在block内修改block外变量会报错，需要加__block，会将值copy到堆区，指针copy
 
 */
- (void)argcBlock{
    __block int number = 10;
    int num = 20;

//    栈区__NSStackBlock__，由于ARC模式下，编译器自动加了copy操作,变成了 堆区__NSMallocBlock__
    void (^argcMallocBlock)(void) = ^{
        number = 11;
        NSLog(@"block--%d",number);
        NSLog(@"block--%d",num);  // 为20，因为block截获的是num的值，而不是指针
    };
    
//    全局区__NSGlobalBlock__，块中无任何外界对象，所需的内存在编译时就确定，内存位于全局区
    void (^argcGlobalBlock)(void) = ^{
        
    };
//    栈区__NSStackBlock__,在ARC模式下，栈区block要有对象属性，block会被copy到栈区,
//    在TongBasisViewController里commonBlock调用
    
 
    num = 30;
    NSLog(@"blockBefore--%d",number);
    argcMallocBlock();
    argcGlobalBlock();
    
    
    NSLog(@"blockAfter--%d",number);
    NSLog(@"class--%@",[argcMallocBlock class]);
    NSLog(@"class--%@",[argcGlobalBlock class]);
    
}

- (void)commonName:(NSString *)name block:(TongCommonBlock)block{
    if ([name isEqualToString:@"Tong"]) {
        block(@"Tong", 22);
    }else{
        block(@"other", 0);
    }
    NSLog(@"%@",[block class]);
}

- (void)commonNameDiff:(NSString *)name block:(void (^)(NSString * _Nonnull, NSInteger))block{
    if ([name isEqualToString:@"Tong"]) {
        block(@"Tong", 25);
    }else{
        block(@"other", 0);
    }
}

@end
