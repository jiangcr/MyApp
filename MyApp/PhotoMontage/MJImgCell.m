//
//  MJImgCell.m
//  MyApp
//
//  Created by jiang on 2017/8/23.
//  Copyright © 2017年 skydrui. All rights reserved.
//

#import "MJImgCell.h"

@implementation MJImgCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _imageView.layer.masksToBounds = YES;
    _imageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _imageView.layer.borderWidth = 0.5f;
}

- (void)setAsset:(id)asset {
    _asset = asset;
}

- (void)setRow:(NSInteger)row {
    _row = row;
    _deleteBtn.tag = row;
}

- (UIView *)snapshotView {
    UIView *snapshotView = [[UIView alloc]init];
    
    UIView *cellSnapshotView = nil;
    
    if ([self respondsToSelector:@selector(snapshotViewAfterScreenUpdates:)]) {
        cellSnapshotView = [self snapshotViewAfterScreenUpdates:NO];
    } else {
        CGSize size = CGSizeMake(self.bounds.size.width + 20, self.bounds.size.height + 20);
        UIGraphicsBeginImageContextWithOptions(size, self.opaque, 0);
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage * cellSnapshotImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        cellSnapshotView = [[UIImageView alloc]initWithImage:cellSnapshotImage];
    }
    
    snapshotView.frame = CGRectMake(0, 0, cellSnapshotView.frame.size.width, cellSnapshotView.frame.size.height);
    cellSnapshotView.frame = CGRectMake(0, 0, cellSnapshotView.frame.size.width, cellSnapshotView.frame.size.height);
    
    [snapshotView addSubview:cellSnapshotView];
    return snapshotView;
}
@end
