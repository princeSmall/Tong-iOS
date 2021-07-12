//
//  ViewController.m
//  Tong- iOS
//
//  Created by Tongle on 2021/5/31.
//

#import "ViewController.h"
#import "TongViewController.h"
#import "TongBasisViewController.h"
#import "TongJumpingViewController.h"
#import "TongNetworkingManager.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc]initWithTitle:@"Tong" style:UIBarButtonItemStyleDone target:self action:@selector(checkupdate)];
    self.navigationItem.rightBarButtonItem = barButton;
    
    // Do any additional setup after loading the view.
}
- (void)checkupdate{
    NSString *url = @"v0.1/public/codepush/update_check";
    NSDictionary *parameter = @{
        @"deployment_key":@"ZNc0XBzl86Nf4M13QYqV22Gmb7UhNLjtyMRgd",
        @"app_version":@"1.1.0"
    };
    [TongNetworkingManager GET:url parameter:parameter success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseDictionary) {
        NSLog(@"success--%@",responseDictionary);
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            NSLog(@"failure--%@",error);
        }];
}

- (void)codepushServer{
    NSString *url = @"v0.1/public/codepush/report_status/download";
    NSDictionary *parameter = @{
        @"deployment_key":@"ZNc0XBzl86Nf4M13QYqV22Gmb7UhNLjtyMRgd",
        @"app_version":@"1.1.0"
    };
    [TongNetworkingManager POST:url parameter:parameter success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseDictionary) {
        NSLog(@"success---%@",responseDictionary);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"failure---%@",error);
    }];
    
}
// test file manager

- (void)localFileSource:(NSString *)key{
    NSString *keyFile = @"/Users/tongle/Library/Developer/CoreSimulator/Devices/1C4B0A6A-BE7F-431D-88EB-DBF09CC5BAAF/data/Containers/Data/Application/A8A9F0A6-D76B-45B2-916C-71A72D57B222/Documents/AmmunitionDepot/hBJch866RcIfdJt-IwITYcPvItNOJwV-ZebU5";
    NSArray *keyArray = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:keyFile error:nil];
    NSString *keyPath = [keyFile stringByAppendingPathComponent:keyArray.lastObject];
    

    NSArray *versionArray = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:keyPath error:nil];
    
    NSString *versionPath;
    if ([versionArray.firstObject isEqualToString:@"PackageInfoConfig.json"]) {
        versionPath =[keyFile stringByAppendingPathComponent:versionArray.lastObject];
    }else{
        versionPath =[keyFile stringByAppendingPathComponent:versionArray.firstObject];
    }
    
    NSLog(@"%@",versionPath);
}


//创建
- (BOOL)creatDirectoryPathWithDeploymentKey:(NSString *)deploymentKey runningVersion:(NSString *)version{
    NSString *path = [self getDeploymentKeyFolderPathWithDeploymentKey:deploymentKey runningVersion:version];
    BOOL isSuccess = [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    return isSuccess;
}

- (NSString *)getLocalSourceFilePath:(NSString *)deploymentKey{
    return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"AmmunitionDepot"] stringByAppendingPathComponent:deploymentKey];
}

//获取
- (NSString *)getDeploymentKeyFolderPathWithDeploymentKey:(NSString *)deploymentKey runningVersion:(NSString *)version{
    return [[[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"AmmunitionDepot"] stringByAppendingPathComponent:deploymentKey] stringByAppendingPathComponent:version] stringByAppendingPathComponent:@"hash"];
}

- (void)pushTongViewController{
    [self.navigationController pushViewController:[TongJumpingViewController new] animated:YES];
//    [self.navigationController pushViewController:[TongBasisViewController new] animated:YES];
//    [self.navigationController pushViewController:[TongViewController new] animated:YES];
}





@end
