//
//  TongJumpingToViewController.m
//  Tong- iOS
//
//  Created by tong on 2021/6/1.
//

#import "TongJumpingToViewController.h"

@interface TongJumpingToViewController ()

@property (nonatomic, strong)NSString *url;

@end

@implementation TongJumpingToViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"%@",self.url);
    // Do any additional setup after loading the view.
}

- (instancetype)initWithUrl:(NSString *)url{
    if (self = [super init]) {
        self.url = url;
    }
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
