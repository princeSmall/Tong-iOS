//
//  TongProtocol.h
//  Tong- iOS
//
//  Created by PrinceSmall on 2021/5/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/**
 1、protocol and category 实现多继承
 2、协议定义的公共接口，抽出相同的行为
 3、实现：遵守协议，实现协议
   调用：遵守协议 id<TongProtocol>delegate
 */

@protocol TongProtocol <NSObject>

//可选实现方法
@optional
- (NSInteger)getStudentSeatNumber:(NSString *)name;
- (NSInteger)getStudentAge:(NSString *)name;

//必须实现方法
@required
- (NSInteger)getStudentCode;

@end

NS_ASSUME_NONNULL_END
