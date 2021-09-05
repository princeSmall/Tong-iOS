//
//  TongKVC.m
//  Tong- iOS
//
//  Created by PrinceSmall on 2021/6/1.
//

#import "TongKVC.h"
#import <objc/runtime.h>

@interface TongKVC()
@property (nonatomic, strong)NSString *kvc;

@property (nonatomic, strong)NSString *name;
@property (nonatomic, assign)NSInteger age;
@property (nonatomic, strong)NSString *address;

@end

@implementation TongKVC

- (NSString *)description{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    uint count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSLog(@"count--%u",count);
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        NSLog(@"%@",property);
        NSString *key = @(property_getName(property));
        id value = [self valueForKey:key];
        if (value != nil) {
            [dic setObject:value forKey:key];
        }
    }
    free(properties);
    return [NSString stringWithFormat:@"%@:%@",[self class],dic];
    
}


@end
