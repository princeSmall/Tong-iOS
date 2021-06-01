//
//  TongNotificationCenter.m
//  Tong- iOS
//
//  Created by Tongle on 2021/6/1.
//

#import "TongNotificationCenter.h"

@implementation TongNotificationCenter

- (void)postNotification{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Tong" object:self userInfo:@{
        @"age":@"20",
        @"sex":@"man"
    }];
    
}

@end
