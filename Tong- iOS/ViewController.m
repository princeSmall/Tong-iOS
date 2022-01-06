//
//  ViewController.m
//  Tong- iOS
//
//  Created by PrinceSmall on 2021/5/31.
//

#import "ViewController.h"
#import "TongViewController.h"
#import "TongBasisViewController.h"
#import "TongJumpingViewController.h"
#import "TongNetworkingManager.h"
#import "TongCodePushDownloader.h"
#import "TongSDImageViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc]initWithTitle:@"Tong" style:UIBarButtonItemStyleDone target:self action:@selector(checkupdate)];
    self.navigationItem.rightBarButtonItem = barButton;
    

    NSLog(@"%d",SERVER_IP);

    int a = 10;
    __block  int b = 10;
    void (^block)(void) = ^{
        b = b + 10;
        NSLog(@"%d",b);
    };
    
    NSLog(@"block2的类：%@",[^{
            NSLog(@"----%d",a);
        } class]);
    
    NSLog(@"%d",b);

    void (^block2)(void) = ^{
        
    };
    NSLog(@"%@",[block2 class]);
    
    
//    [[NSUserDefaults standardUserDefaults] setObject:dateNow forKey:@"loginError"];
    // Do any additional setup after loading the view.
}

- (void)checkupdate{
    TongSDImageViewController *vc = [[TongSDImageViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
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


@end
