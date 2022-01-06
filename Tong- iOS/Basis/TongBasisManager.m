//
//  TongBasisClass.m
//  Tong- iOS
//
//  Created by PrinceSmall on 2021/6/1.
//

#import "TongBasisManager.h"

#import "TongStudent.h"
#import "TongStudent+TongExtension.h"
#import "TongStudent+TongHigh.h"
#import "TongProtocol.h"
#import "TongNotificationCenter.h"
#import "TongKVC.h"

@interface TongBasisManager()<TongProtocol>

@property (nonatomic, strong)TongStudent *student;

@end

@implementation TongBasisManager

+ (instancetype)shareManager{
    static TongBasisManager *manager;
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        manager = [[TongBasisManager alloc]init];
    });
    return manager;
}

- (instancetype)init{
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction:) name:@"Tong" object:nil];
    }
    return self;
}

+ (void)load{
    NSLog(@"TongBasisManager load");
    NSLog(@"%@",[[TongBasisManager shareManager] getStudentName]);
    
    NSLog(@"%@",[[TongBasisManager shareManager] getStudentAddress]);
    
    NSLog(@"%ld", [[TongBasisManager shareManager].student getStudentSeatNumber:@"Tong"]);
    
  
    [[TongBasisManager shareManager] getKVCValue];
}

+ (void)initialize{
    NSLog(@"TongBasisManager initialize");
}


// category
- (NSString *)getStudentName{
    self.student.name = @"Tong";
    [self.student studyEveryDay];
    return self.student.name;
}

/** extension
 声明私有属性
 声明私有方法
 声明私有成员变量
 */

- (NSString *)getStudentAddress{
    self.student.address = @"suzhou";
    [self.student gotoSchoolEveryDay:NO];
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

//NSNotification
- (void)notificationAction:(NSNotification *)params{
    NSLog(@"%@",params);
}

/**KVC
 1、修改私有属性（对象必须有这个属性，否则会报错）
 2、字典模型转换
 */
- (void)getKVCValue{
    TongKVC *kvc = [[TongKVC alloc]init];
    [kvc setValue:@"tong" forKey:@"kvc"];
    NSLog(@"kvc--%@",[kvc valueForKey:@"kvc"]);
}

@end
