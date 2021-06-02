//
//  TongViewController.m
//  Tong- iOS
//
//  Created by Tongle on 2021/6/1.
//

#import "TongViewController.h"
#import "TongNotificationCenter.h"



@interface TongViewController ()

@end

@implementation TongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction:) name:@"Tong" object:nil];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self postNotification];
}

// 移除通知
- (void)dealloc{
    NSLog(@"dealloc");
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Tong" object:nil];
}

// 发送通知
- (void)postNotification{
    TongNotificationCenter *center = [[TongNotificationCenter alloc]init];
    [center postNotification];
}

- (void)notificationAction:(NSNotification *)params{
    NSLog(@"%@",params);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
