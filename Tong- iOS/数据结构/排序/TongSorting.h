//
//  TongSorting.h
//  Tong- iOS
//
//  Created by PrinceSmall on 2021/7/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TongSorting : NSObject

/**
 冒泡排序
 @array : 乱序数组
 */
- (NSArray *)bubbleSort:(NSArray *)array;

/**
 选择排序
 @array : 乱序数组
 */
- (NSArray *)selectionSort:(NSArray *)array;

/**
 快速排序
 @array : 乱序数组
 */
- (NSArray *)quickSort:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
