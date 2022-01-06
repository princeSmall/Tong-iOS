//
//  TongSDImageCell.h
//  Tong- iOS
//
//  Created by Tongle on 2022/1/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TongSDImageCell : UITableViewCell

- (void)setupWithSource:(NSString *)url;
- (void)setupSource:(UIImage *)image;
@end

NS_ASSUME_NONNULL_END
