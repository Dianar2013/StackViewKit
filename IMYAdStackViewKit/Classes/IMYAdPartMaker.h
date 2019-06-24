//
//  IMYAdPartMaker.h
//  IMYAdAssembleViewKit
//
//  Created by 戴惠香 on 2019/5/5.
//  Copyright © 2019 戴惠香. All rights reserved.
//

#import "IMYAdMaker.h"

@interface IMYAdPartMaker : IMYAdMaker

//----------------属性----------------
//布局
@property (nonatomic, strong) UIView *view; 
@property (nonatomic) STMPartPriority compression;//CompressionResistancePriority
@property (nonatomic) STMPartPriority hugging;//ContentHuggingPriority
@property (nonatomic) CGFloat minWidth; //最小宽
@property (nonatomic) CGFloat maxWidth; //最大宽
@property (nonatomic) CGFloat minHeight; //最小高
@property (nonatomic) CGFloat maxHeight; //最大高
//控件属性
//通用部分
//底部
@property (nonatomic, strong) UIColor *backColor;        //底部设置的颜色
@property (nonatomic, strong) UIColor *backBorderColor;  //边线的颜色
@property (nonatomic) CGFloat backBorderWidth;            //边线的大小
@property (nonatomic) CGFloat backBorderRadius;          //边线半径
@property (nonatomic) CGFloat backPaddingHorizontal;     //左右的间隔
@property (nonatomic) CGFloat backPaddingVertical;       //上下的间隔
@property (nonatomic, strong) UIImage *backImage;        //待实现
//按钮
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIColor *buttonHighlightColor;

//Label
@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) NSInteger numberOfLines;//行数 默认一行
@property (nonatomic, assign) NSTextAlignment textHorizontalAlignment;//水平方向对齐方式
@property (nonatomic, assign) STMPartTextVerticalAlignment textVerticalAlignment;//垂直方向对齐方式
//ImageView
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) UIImage *imagePlaceholder;

//Video
@property (nonatomic, strong) NSString *videoUrl;

//Btn
@property (nonatomic, strong) UIImage *btnNormalImage;
@property (nonatomic, strong) UIImage *btnHighLightImage;
@property (nonatomic, strong) UIImage *btnDisableImage;
@property (nonatomic, copy) NSString *btnType;

//----------------方法--------------
//布局
- (IMYAdPartMaker *(^)(UIView *))customViewEqualTo;
- (IMYAdPartMaker *(^)(BOOL))isFillEqualTo;
- (IMYAdPartMaker *(^)(STMPartPriority))compressionEqualTo;
- (IMYAdPartMaker *(^)(STMPartPriority))huggingEqualTo;
- (IMYAdPartMaker *(^)(CGFloat))minWidthEqualTo;
- (IMYAdPartMaker *(^)(CGFloat))maxWidthEqualTo;
- (IMYAdPartMaker *(^)(CGFloat))minHeightEqualTo;
- (IMYAdPartMaker *(^)(CGFloat))maxHeightEqualTo;
//控件属性
//通用
- (IMYAdPartMaker *(^)(UIColor *))backColorIs;
- (IMYAdPartMaker *(^)(NSString *))backColorHexStringIs;
- (IMYAdPartMaker *(^)(UIColor *))backBorderColorIs;
- (IMYAdPartMaker *(^)(NSString *))backBorderColorHexStringIs;
- (IMYAdPartMaker *(^)(CGFloat))backBorderWidthIs;
- (IMYAdPartMaker *(^)(CGFloat))backBorderRadiusIs;
- (IMYAdPartMaker *(^)(CGFloat))backPaddingHorizontalIs;
- (IMYAdPartMaker *(^)(CGFloat))backPaddingVerticalIs;
- (IMYAdPartMaker *(^)(UIButton *))buttonIs;
- (IMYAdPartMaker *(^)(UIColor *))buttonHighlightColorIs;

//Label
- (IMYAdPartMaker *(^)(NSString *))textIs;
- (IMYAdPartMaker *(^)(UIFont *))fontIs;
- (IMYAdPartMaker *(^)(CGFloat))fontSizeIs;
- (IMYAdPartMaker *(^)(UIColor *))colorIs;
- (IMYAdPartMaker *(^)(NSString *))colorHexStringIs; //十六进制颜色
- (IMYAdPartMaker *(^)(STMPartColorType))colorTypeIs;//颜色类型
- (IMYAdPartMaker *(^)(NSInteger))numberOfLinesIs;
- (IMYAdPartMaker *(^)(NSTextAlignment))textHorizontalAlignmentIs;
- (IMYAdPartMaker *(^)(STMPartTextVerticalAlignment))textVerticalAlignmentIs;

//ImageView
- (IMYAdPartMaker *(^)(UIImage *))imageIs;
- (IMYAdPartMaker *(^)(NSString *))imageNameIs;
- (IMYAdPartMaker *(^)(NSString *))imageUrlIs;
- (IMYAdPartMaker *(^)(UIImage *))imagePlaceholderIs;
- (IMYAdPartMaker *(^)(NSString *))imagePlaceholderNameIs;

//Video
- (IMYAdPartMaker *(^)(NSString *))videoUrlIs;

//btn
- (IMYAdPartMaker *(^)(NSString *))btnNormalImageIs;
- (IMYAdPartMaker *(^)(NSString *))btnHighLightlImageIs;
- (IMYAdPartMaker *(^)(NSString *))btnDisableImageIs;
- (IMYAdPartMaker *(^)(NSString *))btnTypeIs;

/*-----辅助方法-----*/
+ (UIColor *)colorWithHexString:(NSString *)hexString;

@end
