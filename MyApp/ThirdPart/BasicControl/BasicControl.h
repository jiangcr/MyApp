//
//  BasicControl.h
//  Loan
//
//  Created by Zhangxiaopei on 15/8/4.
//  Copyright (c) 2015年 shimingguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface BasicControl : NSObject


//声明一个外部函数 可供其他文件调用 调用时只要包含头文件即可
extern CGRect FitRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height);
extern CGFloat FitX(CGFloat x);
extern CGFloat FitY(CGFloat y);
extern CGFloat FitWidth(CGFloat width);
extern CGFloat FitHeight(CGFloat height);
/*
 *适配后的尺寸
 */
+ (CGRect)initWithFrameChanged:(CGRect)rect;
/*
 *初始化一个View控件
 *round  控件是否圆角
 */
+ (UIView *)initWithView:(CGRect)frame backGroundColor:(UIColor *)color roundCorner:(BOOL)round;

/*
 *初始化一个标签控件
 */
+ (UILabel *)initWithLabel:(CGRect)frame title:(NSString *)text labelFont:(UIFont *)font textColor:(UIColor *)color textAlignment:(NSTextAlignment)textAlignment;


/*
 *初始化一个背景图片的按钮
 */
+ (UIButton *)initWithImageButton:(CGRect)frame backImage:(UIImage *)image;

/*
 *初始化一个带标题的按钮
 *round  是否圆角
 */
+ (UIButton *)initWithTitleButton:(CGRect)frame buttonTitle:(NSString *)title titleFont:(UIFont *)font titleColor:(UIColor *)tcolor backGroundColor:(UIColor *)bcolor roundCorner:(BOOL)round;

/*
 *初始化一个带标题有背景图片的按钮
 */
+ (UIButton *)initWithTitleButton:(CGRect)frame buttonTitle:(NSString *)title titleFont:(UIFont *)font titleColor:(UIColor *)tcolor backGroundImage:(UIImage *)image;

/*
 *初始化一个文本输入框控件
 */
+ (UITextField *)initWithTextField:(CGRect)frame borderStyle:(UITextBorderStyle)style holdTitle:(NSString *)hold titleColor:(UIColor *)tcolor titleFont:(UIFont *)tfont textAlignment:(NSTextAlignment)textAlignment;

/*
 *初始化一个图型控件
 */
+ (UIImageView *)initWithImageView:(CGRect)frame setImage:(UIImage *)image;

/*
 *初始化一个tableView
 */
+ (UITableView *)initWithTableView:(CGRect)frame setTabelType:(UITableViewStyle)style backGround:(UIColor *)color;

/*
 *初始化一个UIPickerView
 */
+ (UIPickerView *)initWithPickView:(CGRect)frame setBackGroundColor:(UIColor *)color;

/*
 *初始化一个UIScrollView
 */
+ (UIScrollView *)initWithScrollView:(CGRect)frame;

/*
 *初始化一个UIProgressView
 */
+ (UIProgressView *)initWithProgressView:(CGRect)frame;

@end
