//
//  TongCodePushDownloader.m
//  Tong- iOS
//
//  Created by PrinceSmall on 2021/7/16.
//

#import "TongCodePushDownloader.h"
#import <AFNetworking/AFNetworking.h>

@interface TongCodePushDownloader()
@property(nonatomic, strong) AFHTTPSessionManager *manager;
@end

@implementation TongCodePushDownloader

+ (instancetype)shareManager{
    static TongCodePushDownloader *downloader;
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        downloader = [[TongCodePushDownloader alloc]init];
        [downloader initSessionManager];
    });
    return downloader;
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

- (void)POST:(NSString *)url parameter:(NSDictionary *)parameter progress:(void (^)(NSProgress * _Nonnull))process success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nonnull))success failure:(void (^)(NSURLSessionDataTask * _Nonnull, NSError * _Nonnull))failture{
    [self.manager POST:url parameters:parameter headers:nil progress:process success:success failure:failture];
}

- (void)GET:(NSString *)url parameter:(NSDictionary *)parameter progress:(void (^)(NSProgress * _Nonnull))process success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nonnull))success failure:(void (^)(NSURLSessionDataTask * _Nonnull, NSError * _Nonnull))failture{
    [self.manager GET:url parameters:parameter headers:nil progress:process success:success failure:failture];
}

- (void)downloadWithKey:(NSString *)key
                version:(NSString *)version
                    url:(NSString *)url
               progress:(void(^)(NSProgress *progress))progress
             detination:(NSURL*(^)(NSURL *targetPath, NSURLResponse * response))detination
      completionHandler:(void(^)(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error))completionHandler{

    NSURLSessionDownloadTask * downloadTask = [self.manager downloadTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]] progress:progress destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        return detination(targetPath, response);
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        completionHandler(response,filePath,error);
    }];
    [downloadTask resume];
}


- (void)updateCheckWithKey:(NSString *)key
                   version:(NSString *)version
                   success:(void(^)(NSURLSessionDataTask * task, id res))success
                   failure:(void(^)(NSURLSessionDataTask * task, NSError *error))failure{
    NSString *urlString = @"v0.1/public/codepush/update_check";
    NSDictionary *parameters = @{
        @"deployment_key":key,
        @"app_version":version
    };
    [self.manager GET:urlString parameters:parameters headers:nil progress:nil success:success failure:failure];
}

- (void)reportStatusForDownload:(NSString *)key
                        version:(NSString *)version
                          label:(NSString *)label
                        success:(void (^)(NSURLSessionDataTask * task, id res))success
                        failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure{
    NSString *urlString = @"v0.1/public/codepush/report_Status/download";
    NSDictionary *parameters = @{
        @"deployment_key":key,
        @"app_version": version,
        @"client_unique_id": @"1111",
        @"label": label
    };
    [self.manager POST:urlString parameters:parameters headers:nil progress:nil success:success failure:failure];
}


- (void)reportStatusForDeploy:(NSString *)key
                      version:(NSString *)version
                        label:(NSString *)label
                       status:(NSString *)status
                   success:(void (^)(NSURLSessionDataTask * task, id res))success
                      failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure{
    NSString *urlString = @"v0.1/public/codepush/report_Status/deploy";
    NSDictionary *parameters = @{
        @"deployment_key": key,
        @"app_version": version,
        @"client_unique_id": @"299821",
        @"label": label,
        @"status": status, //@"DeploymentSucceeded"
    };
    
    [self.manager POST:urlString parameters:parameters headers:nil progress:nil success:success failure:failure];
}


+ (NSString *)localCheck:(NSString *)moduleName{
    return nil;
}

+ (void)updateCheck:(NSString *)moduleName deploymentCallback:(void(^)(NSProgress *process,id response, NSError *error))callback{
    
}

+ (void)loadPackage:(NSString *)moduleName deploymentCallback:(void(^)(id response))callback{
    
}


@end
