//
//  IMYAdPartMaker.m
//  IMYAdAssembleViewKit
//
//  Created by 戴惠香 on 2019/5/5.
//  Copyright © 2019 戴惠香. All rights reserved.
//

#import "IMYAdPartMaker.h"


typedef NS_ENUM(NSUInteger, STMPartType) {
    STMPartTypeCustom,
    STMPartTypeUILabel,
    STMPartTypeUIImageView
};

@interface IMYAdPartMaker()

@property (nonatomic,strong) UIStackView *stackView;
@end

@implementation IMYAdPartMaker

- (id)init
{
    self = [super init];
    if (self) {
        self.numberOfLines = 1; //默认一行
    }
    return self;
}

- (IMYAdPartMaker *(^)(UIView *))customViewEqualTo {
    return ^IMYAdPartMaker *(UIView *customView) {
        self.view = customView;
        return self;
    };
}

- (IMYAdPartMaker *(^)(STMPartPriority))compressionEqualTo
{
    return ^IMYAdPartMaker *(STMPartPriority priority) {
        self.compression = priority;
        return self;
    };
}

- (IMYAdPartMaker *(^)(STMPartPriority))huggingEqualTo
{
    return ^IMYAdPartMaker *(STMPartPriority priority) {
        self.hugging = priority;
        return self;
    };
}

- (IMYAdPartMaker *(^)(CGFloat))minWidthEqualTo {
    return ^IMYAdPartMaker *(CGFloat width) {
        self.minWidth = width;
        return self;
    };
}
- (IMYAdPartMaker *(^)(CGFloat))maxWidthEqualTo {
    return ^IMYAdPartMaker *(CGFloat width) {
        self.maxWidth = width;
        return self;
    };
}
- (IMYAdPartMaker *(^)(CGFloat))minHeightEqualTo {
    return ^IMYAdPartMaker *(CGFloat height) {
        self.minHeight = height;
        return self;
    };
}
- (IMYAdPartMaker *(^)(CGFloat))maxHeightEqualTo {
    return ^IMYAdPartMaker *(CGFloat height) {
        self.maxHeight = height;
        return self;
    };
}
//控件
//通用
- (IMYAdPartMaker *(^)(UIColor *))backColorIs {
    return ^IMYAdPartMaker *(UIColor *color) {
        self.backColor = color;
        return self;
    };
}
- (IMYAdPartMaker *(^)(NSString *))backColorHexStringIs {
    return ^IMYAdPartMaker *(NSString *str) {
        self.backColor = [IMYAdPartMaker colorWithHexString:str];
        return self;
    };
}
- (IMYAdPartMaker *(^)(UIColor *))backBorderColorIs {
    return ^IMYAdPartMaker *(UIColor *color) {
        self.backBorderColor = color;
        return self;
    };
}
- (IMYAdPartMaker *(^)(NSString *))backBorderColorHexStringIs {
    return ^IMYAdPartMaker *(NSString *str) {
        self.backBorderColor = [IMYAdPartMaker colorWithHexString:str];
        return self;
    };
}
- (IMYAdPartMaker *(^)(CGFloat))backBorderWidthIs {
    return ^IMYAdPartMaker *(CGFloat size) {
        self.backBorderWidth = size;
        return self;
    };
}
- (IMYAdPartMaker *(^)(CGFloat))backBorderRadiusIs {
    return ^IMYAdPartMaker *(CGFloat rd) {
        self.backBorderRadius = rd;
        return self;
    };
}
- (IMYAdPartMaker *(^)(CGFloat))backPaddingHorizontalIs {
    return ^IMYAdPartMaker *(CGFloat padding) {
        self.backPaddingHorizontal = padding;
        return self;
    };
}
- (IMYAdPartMaker *(^)(CGFloat))backPaddingVerticalIs {
    return ^IMYAdPartMaker *(CGFloat padding) {
        self.backPaddingVertical = padding;
        return self;
    };
}
- (IMYAdPartMaker *(^)(UIButton *))buttonIs {
    return ^IMYAdPartMaker *(UIButton *bt) {
        self.button = bt;
        return self;
    };
}
- (IMYAdPartMaker *(^)(UIColor *))buttonHighlightColorIs {
    return ^IMYAdPartMaker *(UIColor *color) {
        self.buttonHighlightColor = color;
        return self;
    };
}
//label
- (IMYAdPartMaker *(^)(NSString *))textIs {
    return ^IMYAdPartMaker *(NSString *text) {
        self.text = text;
        return self;
    };
}
- (IMYAdPartMaker *(^)(UIFont *))fontIs {
    return ^IMYAdPartMaker *(UIFont *font) {
        self.font = font;
        return self;
    };
}
- (IMYAdPartMaker *(^)(CGFloat))fontSizeIs {
    return ^IMYAdPartMaker *(CGFloat size) {
        self.font = [UIFont systemFontOfSize:size];
        return self;
    };
}
- (IMYAdPartMaker *(^)(UIColor *))colorIs {
    return ^IMYAdPartMaker *(UIColor *color) {
        self.color = color;
        return self;
    };
}
- (IMYAdPartMaker *(^)(NSString *))colorHexStringIs {
    return ^IMYAdPartMaker *(NSString *string) {
        self.color = [IMYAdPartMaker colorWithHexString:string];
        return self;
    };
}
- (IMYAdPartMaker *(^)(STMPartColorType))colorTypeIs {
    return ^IMYAdPartMaker *(STMPartColorType type) {
        switch (type) {
            case STMPartColorWhite:
                self.color = [UIColor whiteColor];
                break;
            case STMPartColorBlack:
                self.color = [UIColor blueColor];
                break;
            case STMpartColorRed:
                self.color = [UIColor redColor];
                break;
            case STMpartColorGray:
                self.color = [UIColor grayColor];
                break;
            case STMpartColorLightGray:
                self.color = [UIColor lightGrayColor];
                break;
            case STMpartColorDarkGray:
                self.color = [UIColor darkGrayColor];
                break;
            case STMpartColorOrange:
                self.color = [UIColor orangeColor];
                break;
        }
        return self;
    };
}
- (IMYAdPartMaker *(^)(NSInteger))numberOfLinesIs
{
    return ^IMYAdPartMaker *(NSInteger numberOfLines) {
        self.numberOfLines = numberOfLines;
        return self;
    };
}

- (IMYAdPartMaker *(^)(NSTextAlignment))textHorizontalAlignmentIs
{
    return ^IMYAdPartMaker *(NSTextAlignment textAlignment) {
        self.textHorizontalAlignment = textAlignment;
        return self;
    };
}
- (IMYAdPartMaker *(^)(STMPartTextVerticalAlignment))textVerticalAlignmentIs
{
    return ^IMYAdPartMaker *(STMPartTextVerticalAlignment textAlignment) {
        self.textVerticalAlignment = textAlignment;
        return self;
    };
}
 
//Image View
- (IMYAdPartMaker *(^)(UIImage *))imageIs {
    return ^IMYAdPartMaker *(UIImage *image) {
        self.image = image;
        return self;
    };
}
- (IMYAdPartMaker *(^)(NSString *))imageNameIs {
    return ^IMYAdPartMaker *(NSString *name) {
        self.image = [UIImage imageNamed:name]; //这里需要根据情况
        return self;
    };
}
- (IMYAdPartMaker *(^)(NSString *))imageUrlIs {
    return ^IMYAdPartMaker *(NSString *url) {
        self.imageUrl = url;
        return self;
    };
}
- (IMYAdPartMaker *(^)(UIImage *))imagePlaceholderIs {
    return ^IMYAdPartMaker *(UIImage *image) {
        self.imagePlaceholder = image;
        return self;
    };
}
- (IMYAdPartMaker *(^)(NSString *))imagePlaceholderNameIs {
    return ^IMYAdPartMaker *(NSString *name) {
        self.imagePlaceholder = [UIImage imageNamed:name];
        return self;
    };
}

- (IMYAdPartMaker *(^)(NSString *))videoUrlIs
{
    return ^IMYAdPartMaker *(NSString *url) {
        self.videoUrl = url;
        return self;
    };
}
- (IMYAdPartMaker *(^)(NSString *))btnNormalImageIs
{
    return ^IMYAdPartMaker *(NSString *name) {
        self.btnNormalImage = [UIImage imageNamed:name];
        return self;
    };
}
- (IMYAdPartMaker *(^)(NSString *))btnHighLightlImageIs
{
    return ^IMYAdPartMaker *(NSString *name) {
        self.btnHighLightImage = [UIImage imageNamed:name];
        return self;
    };
}
- (IMYAdPartMaker *(^)(NSString *))btnDisableImageIs
{
    return ^IMYAdPartMaker *(NSString *name) {
        self.btnDisableImage = [UIImage imageNamed:name];
        return self;
    };
}
- (IMYAdPartMaker *(^)(NSString *))btnTypeIs
{
    return ^IMYAdPartMaker *(NSString *btnType) {
        self.btnType = btnType;
        return self;
    };
}
//辅助方法
+ (UIColor *)colorWithRGBHex:(UInt32)hex {
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:1.0f];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString {
    NSString *stringToConvert = [[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    
    NSScanner *scanner = [NSScanner scannerWithString:stringToConvert];
    unsigned hexNum;
    if (![scanner scanHexInt:&hexNum]) return nil;
    return [IMYAdPartMaker colorWithRGBHex:hexNum];
}

@end

