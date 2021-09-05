//
//  TongNetworkingManager.h
//  Tong- iOS
//
//  Created by PrinceSmall on 2021/7/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TongNetworkingManager : NSObject

+ (void)GET:(NSString *)url parameter:(NSDictionary *)parameter success:(void(^)(NSURLSessionDataTask * task, id responseDictionary))success failure:(void(^)(NSURLSessionDataTask * task, NSError * error))failture;

+ (void)POST:(NSString *)url parameter:(NSDictionary *)parameter success:(void(^)(NSURLSessionDataTask * task, id responseDictionary))success failure:(void(^)(NSURLSessionDataTask * task, NSError * error))failture;

@end

NS_ASSUME_NONNULL_END
