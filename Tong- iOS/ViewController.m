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
#import "TongCodePushDownloader.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc]initWithTitle:@"Tong" style:UIBarButtonItemStyleDone target:self action:@selector(checkupdate)];
    self.navigationItem.rightBarButtonItem = barButton;
    
    NSDate *dateNow = [NSDate date];
    
    NSDate *dateOld = [[NSUserDefaults standardUserDefaults] objectForKey:@"loginError"];
    
    BOOL timeOut = [self compare:dateOld to:dateNow cachePeriod:5];
    
    
//    [[NSUserDefaults standardUserDefaults] setObject:dateNow forKey:@"loginError"];
    // Do any additional setup after loading the view.
}

// 比较两个日期大小
- (BOOL)compare:(NSDate *)startTime to:(NSDate *)endTime cachePeriod:(NSInteger)cachePeriod{
    // 当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 需要对比的时间数据
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth
    | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    // 对比时间差
    NSDateComponents *dateCom = [calendar components:unit fromDate:startTime toDate:endTime options:0];
    
    if (dateCom.month > 1) {
        return YES;
    };
    if (dateCom.day > 1) {
        return YES;
    }
    if (dateCom.hour > 1) {
        return YES;
    }
    NSInteger longMinute = dateCom.minute;
    if (longMinute - cachePeriod >= 0) {
        return YES;
    }else{
        return NO;
    }
}


- (void)checkupdate{
    NSString *key = @"ZNc0XBzl86Nf4M13QYqV22Gmb7UhNLjtyMRgd";
    NSString *version = @"1.1.0";
    
   
    [[TongCodePushDownloader shareManager] updateCheckWithKey:key version:version success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull res) {
        NSString *url = res[@"update_info"][@"download_url"];
        NSLog(@".....%@",url);
        [[TongCodePushDownloader shareManager] downloadWithKey:key version:version url:url progress:^(NSProgress * _Nonnull progress) {
            NSLog(@"⛳️⛳️⛳️⛳️ ==> 下载进度: %.2f%%", (((CGFloat)progress.completedUnitCount / progress.totalUnitCount)) * 100);
        } detination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
            return targetPath;
        } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
            NSLog(@"filePath--%@ ,error --%@", error, filePath);
        }];
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            NSLog(@"-----");
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
