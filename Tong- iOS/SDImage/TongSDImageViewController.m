//
//  TongSDImageViewController.m
//  Tong- iOS
//
//  Created by Tongle on 2022/1/6.
//

#import "TongSDImageViewController.h"
#import "TongSDImageCell.h"
#import <SDWebImage/SDWebImage.h>

@interface TongSDImageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *urlArray;
@property (nonatomic, strong) NSMutableArray *imageArray;
@property (nonatomic, strong) UIImage *image;

@end

@implementation TongSDImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.urlArray = [NSMutableArray array];
    
    [self.urlArray addObject:@"https://static.ecovacs.cn//upload/goods_photo_album/2021/03/22/goods_photo_album_16163830967006.jpg"];
    [self.urlArray addObject:@"https://static.ecovacs.cn//upload/goods_photo_album/2021/02/08/goods_photo_album_16127636101756.jpg"];
    [self.urlArray addObject:@"https://static.ecovacs.cn//upload/goods_photo_album/2021/02/08/goods_photo_album_16127523579355.jpg"];
    // Do any additional setup after loading the view.
    [self reloadRequest];
}
- (void)reloadRequest{
    UIImageView *imageView = [[UIImageView alloc]init];
    self.imageArray = [NSMutableArray array];
    for (NSInteger i=0; i < self.urlArray.count; i++) {
        [imageView sd_setImageWithURL:[NSURL URLWithString:self.urlArray[i]] placeholderImage:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            [self.imageArray addObject:image];
            [self.tableView reloadData];
        }];
    }
    
}

- (void)loadRequest{
    
    SDWebImageDownloaderConfig *config = [SDWebImageDownloaderConfig defaultDownloaderConfig];
    SDWebImageDownloader *downloader = [[SDWebImageDownloader alloc]initWithConfig:config];
    self.imageArray = [NSMutableArray array];
    for (NSInteger i = 0; i < self.urlArray.count ; i ++) {
        [downloader downloadImageWithURL:[NSURL URLWithString:self.urlArray[i]] options:SDWebImageDownloaderUseNSURLCache progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
            [self.imageArray addObject:image];
            [self.tableView reloadData];
        }];
    }
    
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [_tableView registerClass:[TongSDImageCell class] forCellReuseIdentifier:@"identi"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    
    return _tableView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.imageArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"idnetifier";
    TongSDImageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[TongSDImageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setupSource:self.imageArray[indexPath.row]];
    
    return cell;
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
