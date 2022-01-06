//
//  TongSDImageCell.m
//  Tong- iOS
//
//  Created by Tongle on 2022/1/6.
//

#import "TongSDImageCell.h"
#import <SDWebImage/SDWebImage.h>

@interface TongSDImageCell()
@property (nonatomic, strong) UIImageView *imageV;

@end

@implementation TongSDImageCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor redColor];
        self.imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        self.imageV.backgroundColor = [UIColor darkGrayColor];
        [self.contentView addSubview:self.imageV];
    }
    return self;
}

- (void)setupWithSource:(NSString *)url{
//    __weak typeof(self) weakSelf = self;
    [self.imageV sd_setHighlightedImageWithURL:[NSURL URLWithString:url] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        NSLog(@"success");
    }];
}
- (void)setupSource:(UIImage *)image{
    self.imageView.image = image;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
