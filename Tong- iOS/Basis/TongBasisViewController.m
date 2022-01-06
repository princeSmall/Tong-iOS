//
//  TongBasisViewController.m
//  Tong- iOS
//
//  Created by PrinceSmall on 2021/6/1.
//

#import "TongBasisViewController.h"
#import "TongBlock.h"

@interface TongBasisViewController ()
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, strong) TongBlock *tongBlock;

@end

@implementation TongBasisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self commonBlock];
    [self commonDiffBlock];
    // Do any additional setup after loading the view.
}

- (void)dealloc{
    NSLog(@"basis dealloc");
}

// block
- (void)commonBlock{
//    TongBlock *tongBlock = [[TongBlock alloc]init];
    self.tongBlock = [[TongBlock alloc]init];
    _tongBlock.name = @"tong";
    __weak typeof(_tongBlock)weakTongBlock = _tongBlock;
    
    _tongBlock.commonBlock = ^(NSString * _Nullable name, NSInteger age) {
        NSLog(@"%@",weakTongBlock.name);
        self.name = name;
    };
    
    [_tongBlock commonName:@"Tong" block:^(NSString * _Nullable name, NSInteger age) {
        self.name = name;
        self.age = age;
        NSLog(@"%@",_tongBlock.name);
    }];
}

- (void)commonDiffBlock{
    [[TongBlock shareManager] commonNameDiff:@"Tong" block:^(NSString * _Nonnull name, NSInteger age) {
        
    }];
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
