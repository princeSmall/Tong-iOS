//
//  TongNetworkingManager.m
//  Tong- iOS
//
//  Created by PrinceSmall on 2021/7/12.
//

#import "TongNetworkingManager.h"

#import <AFNetworking/AFNetworking.h>

@interface TongNetworkingManager()
@property(nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation TongNetworkingManager

+ (instancetype)shareManager{
    static TongNetworkingManager *manager;
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        manager = [[TongNetworkingManager alloc]init];
        [manager initSessionManager];
    });
    return manager;
}
/**
 1\ codepush测试
 */
- (void)initSessionManager{
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager * manager = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:@"https://code-push.ecouser.net/"] sessionConfiguration:configuration];
    manager.responseSerializer =  [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 60.0f;
    self.manager = manager;
}

+ (void)POST:(NSString *)url parameter:(NSDictionary *)parameter success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nonnull))success failure:(void (^)(NSURLSessionDataTask * _Nonnull, NSError * _Nonnull))failture{
    [[TongNetworkingManager shareManager].manager POST:url parameters:parameter headers:nil progress:nil success:success failure:failture];
}

+ (void)GET:(NSString *)url parameter:(NSDictionary *)parameter success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nonnull))success failure:(void (^)(NSURLSessionDataTask * _Nonnull, NSError * _Nonnull))failture{
    [[TongNetworkingManager shareManager].manager GET:url parameters:parameter headers:nil progress:nil success:success failure:failture];
}

@end
