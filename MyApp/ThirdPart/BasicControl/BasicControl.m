//
//  BasicControl.m
//  Loan
//
//  Created by Zhangxiaopei on 15/8/4.
//  Copyright (c) 2015年 shimingguo. All rights reserved.
//

#import "BasicControl.h"

#import "AppDelegate.h"

AppDelegate *appDelegate;

@implementation BasicControl

void GetAppdelegate(){
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

CG_INLINE CGRect

CGRectMake1(CGFloat x, CGFloat y, CGFloat width, CGFloat height){
    GetAppdelegate();
    CGRect rect;
    rect.origin.x = x * appDelegate.autoSizeScaleX;
    rect.origin.y = y * appDelegate.autoSizeScaleY;
    rect.size.width = width * appDelegate.autoSizeScaleX;
    rect.size.height = height * appDelegate.autoSizeScaleY;
    return rect;
}

CGRect FitRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height){
    GetAppdelegate();
    CGRect rect;
    rect.origin.x = x * appDelegate.autoSizeScaleX;
    rect.origin.y = y * appDelegate.autoSizeScaleY;
    rect.size.width = width * appDelegate.autoSizeScaleX;
    rect.size.height = height * appDelegate.autoSizeScaleY;
    return rect;
}

CGFloat FitX(CGFloat x) {
    GetAppdelegate();
    return x * appDelegate.autoSizeScaleX;
}

CGFloat FitY(CGFloat y) {
    GetAppdelegate();
    return y * appDelegate.autoSizeScaleX;
}

CGFloat FitWidth(CGFloat width) {
    GetAppdelegate();
    return width * appDelegate.autoSizeScaleX;
}

CGFloat FitHeight(CGFloat height) {
    GetAppdelegate();
    return height * appDelegate.autoSizeScaleY;
}
+ (CGRect)initWithFrameChanged:(CGRect)rect
{
    GetAppdelegate();
    CGRect rect_;
    rect_.origin.x = rect.origin.x *appDelegate.autoSizeScaleX;
    rect_.origin.y = rect.origin.y *appDelegate.autoSizeScaleY;
    rect_.size.width = rect.size.width *appDelegate.autoSizeScaleX;
    rect_.size.height = rect.size.height *appDelegate.autoSizeScaleY;
    
    return rect_;
}

/*
 *初始化一个View控件
 *round  控件是否圆角
 */
+ (UIView *)initWithView:(CGRect)frame backGroundColor:(UIColor *)color roundCorner:(BOOL)round
{
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake1(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
    view.backgroundColor = color;
    if (round) {
        [view.layer setMasksToBounds:YES];
        [view.layer setCornerRadius:4.0];
    }
    return view;
}

/*
 *初始化一个标签控件
 */
+ (UILabel *)initWithLabel:(CGRect)frame title:(NSString *)text labelFont:(UIFont *)font textColor:(UIColor *)color textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake1(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = textAlignment;
    label.text = text;
    label.font = font;
    label.textColor = color;
    return label;
}

/*
 *初始化一个背景图片的按钮
 */
+ (UIButton *)initWithImageButton:(CGRect)frame backImage:(UIImage *)image
{
    UIButton *button = [UIButton  buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake1(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
    button.backgroundColor = [UIColor clearColor];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    return button;
}

/*
 *初始化一个带标题的按钮
 *round  是否圆角
 */
+ (UIButton *)initWithTitleButton:(CGRect)frame buttonTitle:(NSString *)title titleFont:(UIFont *)font titleColor:(UIColor *)tcolor backGroundColor:(UIColor *)bcolor roundCorner:(BOOL)round
{
    UIButton *button = [UIButton  buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake1(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
    [button setTitleColor:tcolor forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    button.backgroundColor = bcolor;
    button.titleLabel.font = font;
    if (round) {
        [button.layer setMasksToBounds:YES];
        [button.layer setCornerRadius:4.0];
    }
    return button;
}

/*
 *初始化一个带标题有背景图片的按钮
 */
+ (UIButton *)initWithTitleButton:(CGRect)frame buttonTitle:(NSString *)title titleFont:(UIFont *)font titleColor:(UIColor *)tcolor backGroundImage:(UIImage *)image
{
    UIButton *button = [UIButton  buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake1(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
    [button setTitleColor:tcolor forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    button.titleLabel.font = font;
    return button;
}

/*
 *初始化一个文本输入框控件
 */
+ (UITextField *)initWithTextField:(CGRect)frame borderStyle:(UITextBorderStyle)style holdTitle:(NSString *)hold titleColor:(UIColor *)tcolor titleFont:(UIFont *)tfont textAlignment:(NSTextAlignment)textAlignment
{
    UITextField *textField = [[UITextField alloc] init];
    textField.frame = CGRectMake1(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
    textField.borderStyle = style;
    textField.placeholder = hold;
    textField.textColor = tcolor;
    textField.font = tfont;
    textField.textAlignment = textAlignment;
    return textField;
}

/*
 *初始化一个图型控件
 */
+ (UIImageView *)initWithImageView:(CGRect)frame setImage:(UIImage *)image
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake1(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
    [imageView setImage:image];
    return imageView;
}

/*
 *初始化一个tableView
 */
+ (UITableView *)initWithTableView:(CGRect)frame setTabelType:(UITableViewStyle)style backGround:(UIColor *)color
{
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake1(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height) style:style];
    [table setBackgroundColor:color];
    return table;
}

/*
 *初始化一个UIPickerView
 */
+ (UIPickerView *)initWithPickView:(CGRect)frame setBackGroundColor:(UIColor *)color
{
    UIPickerView *pickView = [[UIPickerView alloc] initWithFrame:CGRectMake1(frame.origin.x,frame.origin.y,frame.size.width,frame.size.height)];
    pickView.backgroundColor = color;
    return pickView;
}

/*
 *初始化一个UIScrollView
 */
+ (UIScrollView *)initWithScrollView:(CGRect)frame
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake1(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
    return scrollView;
}

/*
 *初始化一个UIProgressView
 */
+ (UIProgressView *)initWithProgressView:(CGRect)frame
{
    UIProgressView *progress = [[UIProgressView alloc] initWithFrame:CGRectMake1(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
    [progress setProgressViewStyle:UIProgressViewStyleDefault];
    progress.progress = 0;
    
    return progress;
}

@end
