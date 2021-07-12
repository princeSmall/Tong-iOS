//
//  TongArray.m
//  Tong- iOS
//
//  Created by Tongle on 2021/7/12.
//

#import "TongArray.h"

@implementation TongArray

- (instancetype)shareManager{
    static TongArray *manager;
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        manager = [[TongArray alloc]init];
    });
    return manager;
}

+ (void)load{
    
}

/***
 
 [self arrayComponentsJoin];
 [self localFileSource:@"9999999999"];
 
NSArray *mergeArray = [self merge:@[@[@(1),@(5)],@[@(2),@(8)],@[@(10),@(12)],@[@(19),@(20)]]];
 NSLog(@"%@",mergeArray);
 
 [self setZeroes:@[
     @[@(1), @(2), @(3)],
     @[@(0), @(1), @(2)],
     @[@(9), @(0), @(1)]
 ]];
 */

/**
 arrar 合并区间
 @params array 数组集合
 [[1,5],[2,6],[10,18],[20,25]]
 */
- (NSArray *)merge:(NSArray *)array{
    NSMutableArray *mergeArray = [NSMutableArray array];
    for (int i = 0; i < array.count; i++) {
        int j = i+1;
        if (j == array.count) {
            return mergeArray;
        }
        NSArray *arrL = mergeArray.lastObject ? : array[i];
        NSArray *arrR = array[j];
        
        NSInteger l = [arrL.lastObject integerValue];
        NSInteger r = [arrR.firstObject integerValue];
        if (l >= r) {
            [mergeArray removeObject:mergeArray.lastObject];
            [mergeArray addObject:@[arrL.firstObject,arrR.lastObject]];
        }else{
            [mergeArray addObject:arrR];
        }
    }
    return mergeArray;
}

/**
 同行列有0则置0
 @[
 [1, 2, 3]
 [0, 1, 2]
 [9, 0, 1]
 ]  ===> @[
 [0, 0, 3]
 [0, 0, 0]
 [0, 0, 0]
 ]
 */
- (void)setZeroes:(NSArray *)array{
    
    NSMutableArray *lineArray = [NSMutableArray array];
    [lineArray addObjectsFromArray:array];
    
    for (int i = 0 ; i < array.count; i++) {
        NSArray *arr = array[i];
        for (int j = 0; j < arr.count; j++) {
            NSNumber *numJ = arr[j];
            if (numJ.integerValue == 0) {
                for (int i = 0 ; i < lineArray.count; i++) {
                    NSMutableArray *arr = [NSMutableArray arrayWithArray:lineArray[i]];
                    [arr replaceObjectAtIndex:j withObject:@(0)];
                    [lineArray replaceObjectAtIndex:i withObject:arr];
                }
                [lineArray replaceObjectAtIndex:i withObject:@[@(0),@(0),@(0)]];
                break;
            }
           
        }
    }
    
    
    
    NSLog(@"---%@",lineArray);
    
}

@end
