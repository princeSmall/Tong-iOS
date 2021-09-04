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

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc]initWithTitle:@"Tong" style:UIBarButtonItemStyleDone target:self action:@selector(pushTongViewController)];
    self.navigationItem.rightBarButtonItem = barButton;
    // Do any additional setup after loading the view.
}

- (void)pushTongViewController{
//    [self.navigationController pushViewController:[TongJumpingViewController new] animated:YES];
    [self.navigationController pushViewController:[TongBasisViewController new] animated:YES];
//    [self.navigationController pushViewController:[TongViewController new] animated:YES];
}





@end
