//
//  TongLeetCodeArray.m
//  Tong- iOS
//
//  Created by tong on 2021/6/8.
//

#import "TongLeetCodeArray.h"

@implementation TongLeetCodeArray

+ (instancetype)shareManager{
    static dispatch_once_t token;
    static TongLeetCodeArray *manager;
    dispatch_once(&token, ^{
        manager = [[TongLeetCodeArray alloc]init];
    });
    return manager;
}

+ (void)load{
//    [1,7,3,6,5,6]
    NSInteger pivotIndex = [[TongLeetCodeArray shareManager] pivotIndex:@[@(1),@(7),@(3),@(6),@(5),@(6)]];
    NSInteger pivotIndexE = [[TongLeetCodeArray shareManager] pivotIndexExample:@[@(1),@(7),@(3),@(6),@(5),@(6)]];
    
    NSLog(@"pivotIndex---%ld,%ld",pivotIndex,pivotIndexE);
    
//    [1,3,5,6], 0
    NSInteger searchInset = [[TongLeetCodeArray shareManager] searchInset:@[@(1),@(3),@(5),@(6)] target:0];
    NSLog(@"searchInset--%ld",searchInset);
//   [[1,5],[2,6],[8,10],[15,18]]
    NSArray *array = @[@[@(1),@(5)],@[@(2),@(6)],@[@(8),@(10)],@[@(18),@(20)]];
    NSArray *mergeArray = [[TongLeetCodeArray shareManager] merge:array];
    NSLog(@"mergeArray--%@",mergeArray);
    
    
}


/** I
 寻找数组的中心索引
 给你一个整数数组 nums，请编写一个能够返回数组 “中心下标” 的方法。

 数组 中心下标 是数组的一个下标，其左侧所有元素相加的和等于右侧所有元素相加的和。

 如果数组不存在中心下标，返回 -1 。如果数组有多个中心下标，应该返回最靠近左边的那一个。

 注意：中心下标可能出现在数组的两端。

 */
// 自己写的
- (NSInteger)pivotIndex:(NSArray *)nums{
    NSInteger numI = 0;
    NSInteger numJ = 0;
    BOOL isI = false;
    for(NSInteger i = 0 ;i < nums.count;){
        numI = numI + [nums[i] integerValue];
        for(NSInteger j = nums.count - 1; j > i;){
            if (isI == false) {
                numJ = numJ + [nums[j] integerValue];
            }
            if (numJ == 0){
                return 0;
            }else if (numI == 0){
                return nums.count + 1;
            }
            if (numI < numJ) {
                i++;
                isI = true;
                break;
            }else if (numI > numJ){
                isI = false;
                j--;
            }else{
                return i+1;
            }
        }
        
    }
    return -1;
}
// 官方的

- (NSInteger)pivotIndexExample:(NSArray *)nums{
    NSInteger total = 0;
    for (int i = 0; i < nums.count; i++) {
        total = total + [nums[i] integerValue];
    }
    
    NSInteger sum = 0;
    
    for (int j = 0 ; j < nums.count; j++) {
        if (sum * 2 + [nums[j] integerValue] == total) {
            return j;
        }
        sum = sum + [nums[j] integerValue];
    }
    return -1;
    
}
/** II
 搜索插入位置
 
 给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。
 你可以假设数组中无重复元素。
 */

- (NSInteger)searchInset:(NSArray *)nums target:(NSInteger)target{
    
    
    for (int i = 0; i < nums.count; i ++) {
        if ([nums[i] integerValue] >= target) {
            return i;
        }
    }
    return nums.count;

}

/**
 
 输入：intervals = [[1,3],[2,6],[8,10],[15,18]]
 输出：[[1,6],[8,10],[15,18]]
 解释：区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].

 */
- (NSArray *)merge:(NSArray *)nums{
    
    NSMutableArray *newArray = [NSMutableArray array];
    for (int i = 0; i < nums.count;) {
        NSArray *arrayI = nums[i];
        NSArray *arrayJ = nums[i];
        if ([arrayI.lastObject integerValue] > [arrayJ.firstObject integerValue]) {
            [newArray addObject:@[arrayI.firstObject, arrayJ.lastObject]];
            i = i+2;
        }else{
            i++;
            [newArray addObject:arrayI];
        }
        
    }
    
    return newArray;

}


@end
