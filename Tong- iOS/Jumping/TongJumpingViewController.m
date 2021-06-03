//
//  TongJumpingViewController.m
//  Tong- iOS
//
//  Created by tong on 2021/6/1.
//

#import "TongJumpingViewController.h"
#import "TongTargetJumping.h"
#import "TongUrlJumping.h"
#import "TongProtocolJumping.h"

@interface TongJumpingViewController ()

@property (nonatomic, strong)NSDictionary *params;

@end

@implementation TongJumpingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self layoutJumpingSubviews];
    // Do any additional setup after loading the view.
}


- (void)layoutJumpingSubviews{
    CGFloat width = [[UIScreen mainScreen] bounds].size.width / 3.0 -20;
    CGFloat height = width / 2.0;
    for (int i = 0; i < 3; i ++) {
        UIButton *jumpingButton = [[UIButton alloc]initWithFrame:CGRectMake(width * i + 15*(i+1), 300, width, height)];
        [jumpingButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        jumpingButton.layer.borderWidth = 1;
        jumpingButton.layer.borderColor = [UIColor blackColor].CGColor;
        jumpingButton.layer.cornerRadius = 10;
        jumpingButton.tag = i;
        [jumpingButton addTarget:self action:@selector(jumpingToViewController:) forControlEvents:UIControlEventTouchUpInside];
        [jumpingButton setTitle:self.params.allKeys[i] forState:UIControlStateNormal];
        [self.view addSubview:jumpingButton];
    }
}

// 通过反射机制根据方法名获取方法
- (void)jumpingToViewController:(UIButton *)sender{
    NSString *selectorString = self.params.allValues[sender.tag];
    SEL selector = NSSelectorFromString(selectorString);
   [self performSelector:selector];
}

- (void)targetActionJumping{
    UIViewController *viewController = [TongTargetJumping targetViewController:@"https://www.baidu.com"];
    [self.navigationController pushViewController:viewController animated:YES];
    
    NSLog(@"targetActionJumping");
}

- (void)urlSchemeJumping{
    [TongUrlJumping openUrl:@"https://url" params:@{@"url":@"www.baidu.com",@"nav":self.navigationController}];
    NSLog(@"urlSchemeJumping");
}

- (void)protocolClassJumping{
   UIViewController *viewController = [TongProtocolJumping jumpingViewControllerWithProtocol:@protocol(jumpingProtocol) withParams:@{@"url":@"https://www.baidu.com"}];
    [self.navigationController pushViewController:viewController animated:YES];
    
    NSLog(@"protocolClassJumping");
}

// 通过策略模式减少if else 等判断
- (NSDictionary *)params{
    if (!_params) {
        _params = @{
            @"protocol":@"protocolClassJumping",
            @"target":@"targetActionJumping",
            @"url":@"urlSchemeJumping",
        };
    };
    return _params;
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
