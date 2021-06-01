//
//  ViewController.m
//  Tong- iOS
//
//  Created by Tongle on 2021/5/31.
//

#import "ViewController.h"
#import "TongStudent.h"
#import "TongStudent+TongExtension.h"
#import "TongStudent+TongHigh.h"
#import "TongProtocol.h"


@interface ViewController ()<TongProtocol>

@property (nonatomic, strong)TongStudent *student;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",[self getStudentName]);
    
    NSLog(@"%@",[self getStudentAddress]);
    
    NSLog(@"%ld", [self.student getStudentSeatNumber:@"Tong"]);
    
    // Do any additional setup after loading the view.
}

// category
- (NSString *)getStudentName{
    self.student.name = @"Tong";
    [self.student gotoHightSchoolEveryData];
    return self.student.name;
}

/** extension
 声明私有属性
 声明私有方法
 声明私有成员变量
 */

- (NSString *)getStudentAddress{
    self.student.address = @"suzhou";
    [self.student gotoSchoolEveryDay];
    return self.student.address;
}

- (TongStudent *)student{
    if (!_student) {
        _student = [[TongStudent alloc]init];
        _student.delegate = self;
    }
    return _student;
}

/**protocol
 
 */

//optional
- (NSInteger)getStudentSeatNumber:(NSString *)name{
    if ([name isEqualToString:@"Tong"]) {
        return 110;
    }else{
        return 1;
    }
}

//require
- (NSInteger)getStudentCode{
    return 100;
}


@end
