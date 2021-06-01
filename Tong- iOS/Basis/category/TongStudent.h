//
//  TongStudent.h
//  Tong- iOS
//
//  Created by Tongle on 2021/5/31.
//

#import <Foundation/Foundation.h>
#import "TongProtocol.h"


NS_ASSUME_NONNULL_BEGIN

@interface TongStudent : NSObject

@property (nonatomic, assign) id <TongProtocol> delegate;

- (NSInteger)getStudentSeatNumber:(NSString *)name;

- (void)gotoSchoolEveryDay:(BOOL)isHigh;

@end

NS_ASSUME_NONNULL_END
