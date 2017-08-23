//
//  SelectImgVC.m
//  MyApp
//
//  Created by jiang on 2017/8/23.
//  Copyright © 2017年 skydrui. All rights reserved.
//

#import "SelectImgVC.h"

//#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import <SVProgressHUD.h>
#import <TZImagePickerController.h>
#import "LxGridViewFlowLayout.h"
#import "MJImgCell.h"

@interface SelectImgVC ()<UICollectionViewDataSource,UICollectionViewDelegate,TZImagePickerControllerDelegate,UICollectionViewDelegateFlowLayout>
{
    NSMutableArray *_selectedPhotos;
    NSMutableArray *_selectedAssets;
    NSInteger       _maxCount;
    BOOL _isSelectOriginalPhoto;
}

@property (nonatomic, strong) UICollectionView *collectionView;
@property (strong, nonatomic) LxGridViewFlowLayout *layout;

@end
static NSInteger margin = 5;
@implementation SelectImgVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"合成";
    self.view.backgroundColor = [UIColor whiteColor];
    _selectedPhotos = [NSMutableArray array];
    _selectedAssets = [NSMutableArray array];
    _maxCount = 9;
    
    [self configCollectionView];
    
    [self configSaveBtn];
    
    [self configModelView];
    
}

- (void)configCollectionView {
    _layout = [[LxGridViewFlowLayout alloc] init];
    _layout.minimumInteritemSpacing = margin;
    _layout.minimumLineSpacing = margin;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenWidth+10) collectionViewLayout:_layout];
    _collectionView.backgroundColor = [UIColor orangeColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.contentInset = UIEdgeInsetsMake(10, 5, 10, 5);
    [_collectionView registerNib:[UINib nibWithNibName:@"MJImgCell" bundle:nil] forCellWithReuseIdentifier:@"MJImgCell"];
    [self.view addSubview:_collectionView];
}

- (void)configSaveBtn {
    UIButton * saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [saveBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(saveImgAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:saveBtn];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

- (void)configModelView {
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, _collectionView.bottom+5, ScreenWidth-15, 18)];
    titleLabel.text = @"选择模板";
    [self.view addSubview:titleLabel];
}
#pragma mark UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (_selectedPhotos.count < _maxCount) {
        return _selectedPhotos.count+1;
    }else{
        return _maxCount;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MJImgCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MJImgCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MJImgCell" owner:self options:nil] objectAtIndex:0];
    }
    cell.deleteBtn.hidden = YES;

    if (indexPath.row == _selectedPhotos.count) {
        cell.imageView.image = [UIImage imageNamed:@"AlbumAddBtn.png"];
    } else {
        cell.imageView.image = _selectedPhotos[indexPath.row];
        cell.asset = _selectedAssets[indexPath.row];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == _selectedPhotos.count) {
        [self pushTZImagePickerController];
    } else { // preview photos
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithSelectedAssets:_selectedAssets selectedPhotos:_selectedPhotos index:indexPath.row];
        imagePickerVc.maxImagesCount = _maxCount;
        imagePickerVc.allowPickingOriginalPhoto = YES;
        imagePickerVc.isSelectOriginalPhoto = YES;
        [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            _selectedPhotos = [NSMutableArray arrayWithArray:photos];
            _selectedAssets = [NSMutableArray arrayWithArray:assets];
            _isSelectOriginalPhoto = isSelectOriginalPhoto;
            [_collectionView reloadData];
        }];
        [self presentViewController:imagePickerVc animated:YES completion:nil];
    }
}
#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((ScreenWidth-20)/3, (ScreenWidth-20)/3);
}
- (void)deleteBtnClik:(UIButton *)sender {
    [_selectedPhotos removeObjectAtIndex:sender.tag];
    [_selectedAssets removeObjectAtIndex:sender.tag];
    
    [_collectionView performBatchUpdates:^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:sender.tag inSection:0];
        [_collectionView deleteItemsAtIndexPaths:@[indexPath]];
    } completion:^(BOOL finished) {
        [_collectionView reloadData];
    }];
}

#pragma mark - TZImagePickerController
- (void)pushTZImagePickerController {
   
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:_maxCount columnNumber:3 delegate:self pushPhotoPickerVc:YES];
    imagePickerVc.isSelectOriginalPhoto = _isSelectOriginalPhoto;
    
    if (_maxCount > 1) {
        // 1.设置目前已经选中的图片数组
        imagePickerVc.selectedAssets = _selectedAssets; // 目前已经选中的图片数组
    }
    
    imagePickerVc.allowTakePicture = NO; // 在内部显示拍照按钮
    
    // 3. 设置是否可以选择图片/原图
    imagePickerVc.allowPickingImage = YES;
    imagePickerVc.allowPickingOriginalPhoto = YES;
    
    // 你可以通过block，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        _selectedPhotos = [NSMutableArray arrayWithArray:photos];
        _selectedAssets = [NSMutableArray arrayWithArray:assets];
        _isSelectOriginalPhoto = isSelectOriginalPhoto;
        [_collectionView reloadData];
    }];
    
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}

#pragma mark - Action
- (void)saveImgAction {
    [SVProgressHUD showWithStatus:@"正在保存。。。"];
    UIGraphicsBeginImageContextWithOptions(_collectionView.bounds.size, NO, 0);
    CGContextRef ctx =  UIGraphicsGetCurrentContext();
    [_collectionView.layer renderInContext:ctx];
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    //保存到本地相机
    UIImageWriteToSavedPhotosAlbum(newImage,self,@selector(image:didFinishSavingWithError:contextInfo:),nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error
  contextInfo:(void *)contextInfo{
    
    [SVProgressHUD dismiss];
    if (error != NULL){
        [SVProgressHUD showErrorWithStatus:@"保存失败"];
    }else{
        [SVProgressHUD showSuccessWithStatus:@"已保存到相册"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
