//
//  TongCodePushDownloader.h
//  Tong- iOS
//
//  Created by Tongle on 2021/7/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TongCodePushDownloader : NSObject

+ (instancetype)shareManager;

+ (NSString *)localCheck:(NSString *)moduleName;

+ (void)updateCheck:(NSString *)moduleName deploymentCallback:(void(^)(NSProgress *process,id response, NSError *error))callback;

+ (void)loadPackage:(NSString *)moduleName deploymentCallback:(void(^)(id response))callback;


- (void)downloadWithKey:(NSString *)key
                version:(NSString *)version
                    url:(NSString *)url
               progress:(void(^)(NSProgress *progress))progress
             detination:(NSURL*(^)(NSURL *targetPath, NSURLResponse * response))detination
      completionHandler:(void(^)(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error))completionHandler;


- (void)updateCheckWithKey:(NSString *)key
                   version:(NSString *)version
                   success:(void(^)(NSURLSessionDataTask * task, id res))success
                   failure:(void(^)(NSURLSessionDataTask * task, NSError *error))failure;

- (void)reportStatusForDownload:(NSString *)key
                        version:(NSString *)version
                          label:(NSString *)label
                        success:(void (^)(NSURLSessionDataTask * task, id res))success
                        failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure;


- (void)reportStatusForDeploy:(NSString *)key
                      version:(NSString *)version
                        label:(NSString *)label
                       status:(NSString *)status
                   success:(void (^)(NSURLSessionDataTask * task, id res))success
                      failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure;


- (void)GET:(NSString *)url parameter:(NSDictionary *)parameter
   progress:(void (^ _Nullable )(NSProgress * process))process
    success:(void(^)(NSURLSessionDataTask * task, id responseDictionary))success
    failure:(void(^)(NSURLSessionDataTask * task, NSError * error))failture;

- (void)POST:(NSString *)url
   parameter:(NSDictionary *)parameter
    progress:(void (^ _Nullable )(NSProgress * process))process
     success:(void(^)(NSURLSessionDataTask * task, id responseDictionary))success
     failure:(void(^)(NSURLSessionDataTask * task, NSError * error))failture;



@end

NS_ASSUME_NONNULL_END
