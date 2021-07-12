//
//  TongSorting.m
//  Tong- iOS
//
//  Created by Tongle on 2021/7/6.
//

#import "TongSorting.h"

@implementation TongSorting

+ (instancetype)defaultManager{
    static dispatch_once_t once_token;
    static TongSorting *sorting;
    dispatch_once(&once_token, ^{
        sorting = [[TongSorting alloc]init];
    });
    return sorting;;
}

#pragma mark -- load
+(void)load{
    NSArray *sortingArray = @[@(8),@(5),@(7),@(1),@(4),@(3),@(6),@(2),@(9)];
    NSArray *bubble = [[self defaultManager] bubbleSort:sortingArray];
    NSArray *selectioin = [[self defaultManager] selectionSort:sortingArray];
    NSArray *quick = [[self defaultManager] quickSort:sortingArray];
    NSLog(@"bubble--%@",bubble);
    NSLog(@"selectioin--%@",selectioin);
    NSLog(@"quick--%@",quick);
}

#pragma mark -- 冒泡排序
/**
 1、相邻的两个元素进行比较，如果出现反序就交换，否则就执行下一次比较。
 2、⚠️j每次都比i大一，
 3、时间复杂度O（n2）
 */
- (NSArray *)bubbleSort:(NSArray *)array{
    NSMutableArray *mArray = [NSMutableArray arrayWithArray:array];
    for (int i = 0 ; i < mArray.count; i ++) {
        for (int j = i + 1; j < mArray.count; j++) {
            NSInteger intI = [mArray[i] integerValue];
            NSInteger intJ = [mArray[j] integerValue];
            if (intI > intJ) {
                [mArray exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
        }
    }
    return mArray;
}

#pragma mark -- 选择排序
/**
 1、从数组第一个下坐标一直比较到最后一个下坐标。每一次的外层循环都能确定一个下坐标的数
 2、⚠️ 有交换才记录下标识
 3、时间复杂度始终是O（n2）
 */
- (NSArray *)selectionSort:(NSArray *)array{
    NSMutableArray *lastArray = [NSMutableArray arrayWithArray:array];
    for (int i = 0; i < lastArray.count; i ++) {
        NSInteger intI = [lastArray[i] integerValue];
        NSInteger num = 0;
        for (int j = i + 1; j < lastArray.count; j++) {
            NSInteger intJ = [lastArray[j] integerValue];
            if (intI > intJ) {
                intI = intJ;
                num = j;
            }
        }
        if (num != 0) {
            [lastArray exchangeObjectAtIndex:i withObjectAtIndex:num];
        }
    }
    return lastArray;
}

#pragma mark -- 快速排序
/**
 在数组随机选择一个元素(一般以数组第一个元素开始)，当做基准数。用基准数与数组其他元素进行比较。将数组中比基准数大的放在右边，比基准数小的放在左边
 */

/**
 @[@(8),@(5),@(7),@(1),@(4),@(3),@(6),@(2),@(9)]
 5，7，1，4，3，6 ，2   --8--   9
 2，1，4，3  -- 5--  6，7
 1  -- 2-- 4，3
 1， 2，3，4，5，6，7，8，9，10
 
 */
- (void)quickSortChild:(NSMutableArray *)array leftIndex:(NSInteger)l rightIndex:(NSInteger)r{
    
    if (l > r) {
        return;
    }
    NSInteger loc = [array[l] integerValue];
    
    while (l < r) {
        while (l < r && [array[r] integerValue] <= loc) {
            r--;
        }
        array[r] = array[l];
        
        while (l < r && [array[l] integerValue] >= loc) {
            l++;
        }
        array[l] = array[r];
    }
    array[l] = @(loc);

    [self quickSortChild:array leftIndex:l rightIndex:l - 1];
    [self quickSortChild:array leftIndex:l + 1 rightIndex:r];
   
    
}
- (NSArray *)quickSort:(NSArray *)array{
    NSMutableArray *m = [NSMutableArray arrayWithArray:array];
    [self quickSortChild:m leftIndex:0 rightIndex:m.count - 1];
    return m;
}

@end
