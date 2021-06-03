//
//  TongJumpingToViewController.m
//  Tong- iOS
//
//  Created by tong on 2021/6/1.
//

#import "TongJumpingToViewController.h"
#import "TongUrlJumping.h"
#import "TongProtocolJumping.h"

@interface TongJumpingToViewController ()<jumpingProtocol>

@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSDictionary *params;
@end

@implementation TongJumpingToViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"%@",self.url);
    // Do any additional setup after loading the view.
}


+ (void)load{
    [TongUrlJumping registerScheme:@"https://url" jumpingBlock:^(NSDictionary * _Nonnull params) {
        NSLog(@"%@",params);
        UINavigationController *nav = (UINavigationController *)[params objectForKey:@"nav"];
        TongJumpingToViewController *viewController = [TongJumpingToViewController new];
        viewController.params = params;
        [nav pushViewController:viewController animated:YES];
    }];
    
    [TongProtocolJumping registerProtocol:@protocol(jumpingProtocol) cla:[self class]];
}

- (instancetype)initWithUrl:(NSString *)url{
    if (self = [super init]) {
        self.url = url;
    }
    return self;
}

- (TongJumpingToViewController *)jumpingViewControllerWithParams:(NSDictionary *)params{
    self.params = params;
    return self;
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
