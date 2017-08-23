//
//  MJImgCell.h
//  MyApp
//
//  Created by jiang on 2017/8/23.
//  Copyright © 2017年 skydrui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

@interface MJImgCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@property (nonatomic, strong) PHAsset * asset;
@property (nonatomic, assign) NSInteger row;

- (UIView *)snapshotView;
@end
