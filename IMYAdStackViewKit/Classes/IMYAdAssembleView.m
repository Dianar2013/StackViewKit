//
//  IMYAdAssembleView.m
//  IMYAdAssembleViewKit
//
//  Created by 戴惠香 on 2019/5/5.
//  Copyright © 2019 戴惠香. All rights reserved.
//

#import "IMYAdAssembleView.h"
#import "NSString+Assemble.h"
#import "IMYAdMaker.h"
#import "Masonry.h"
#import "IMYAdPartView.h"
#import <objc/message.h>

@interface IMYAdAssembleView()

@property (nonatomic, strong) IMYAdAssembleMaker *maker;
@end

@implementation IMYAdAssembleView

/*-------------创建Assemble View------------*/
+ (IMYAdAssembleView *)createView:(void(^)(IMYAdAssembleMaker *))assembleMaker {
    IMYAdAssembleView *assembleView = [[self alloc] init];
    assembleView.backgroundColor = [UIColor clearColor];
    assembleView.maker = [[IMYAdAssembleMaker alloc] init];
    assembleMaker(assembleView.maker);
    assembleView = [assembleView buildAssembleView];
    return assembleView;
}
- (IMYAdAssembleView *)buildAssembleView{
    IMYAdAssembleMaker *assembleMaker = self.maker;
    if (!(assembleMaker.subViews.count > 0)) {
        return self;
    }
    __block UIView *lastView = nil;
    __block CGFloat xViewPadding = assembleMaker.padding;
    __block CGFloat assembleTopMargin = assembleMaker.topMargin;
    __block CGFloat assembleBottomMargin = assembleMaker.bottomMargin;
    __block CGFloat assembleLeftMargin = assembleMaker.leftMargin;
    __block CGFloat assembleRightMargin = assembleMaker.rightMargin;
   
    self.spacing = xViewPadding;
    if (self.maker.arrange == STMAssembleArrangeHorizontal) { //水平方向or 竖直方向
        self.axis = UILayoutConstraintAxisHorizontal;
    }else {
        self.axis = UILayoutConstraintAxisVertical;
    }
 
    if (self.maker.alignment == STMAssembleAlignmentTop) { //对齐方式
        self.alignment = UIStackViewAlignmentTop;
    }else if (self.maker.alignment == STMAssembleAlignmentLeft) {
        self.alignment = UIStackViewAlignmentLeading;
    }else if (self.maker.alignment == STMAssembleAlignmentRight) {
        self.alignment = UIStackViewAlignmentTrailing;
    }else if (self.maker.alignment == STMAssembleAlignmentBottom) {
        self.alignment = UIStackViewAlignmentBottom;
    }else {
        self.alignment = UIStackViewAlignmentCenter;
    }
    
    if (self.maker.distribution == STMAssembleADistributionFillEqually) { //填充方式
        self.distribution = UIStackViewDistributionFillEqually;
    }else if (self.maker.distribution == STMAssembleDistributionFillProportionally) {
        self.distribution = UIStackViewDistributionFillProportionally;
    }else if (self.maker.distribution == STMAssembleDistributionEqualSpacing) {
        self.distribution = UIStackViewDistributionEqualSpacing;
    }else if (self.maker.distribution == STMAssembleDistributionEqualCentering) {
        self.distribution = UIStackViewDistributionEqualCentering;
    }else {
        self.distribution = UIStackViewDistributionFill;
    }
   
    self.layoutMargins = UIEdgeInsetsMake(assembleTopMargin, assembleLeftMargin, assembleBottomMargin, assembleRightMargin);
    self.layoutMarginsRelativeArrangement = YES;
    
    for (id x in assembleMaker.subViews) {
        UIView *xView = nil;
        IMYAdPartView *partView = nil;
        IMYAdMaker *partMarker = nil;
        if ([x isKindOfClass:[IMYAdPartView class]]) {
            partView = (IMYAdPartView *)x;
            partMarker = partView.maker;
            xView = partView.maker.view;
        } else {
            xView = (UIView *)x;
            partMarker = ((IMYAdAssembleView*)xView).maker;
        }
        [self addArrangedSubview:xView];

        //设置抗压缩权重
        if (partView.maker.compression != STMPriorityDefault) {
            if (assembleMaker.arrange == STMAssembleArrangeHorizontal) {
                switch (partView.maker.compression) {
                    case STMPriorityFittingSizeLevel:
                        [xView setContentCompressionResistancePriority:UILayoutPriorityFittingSizeLevel forAxis:UILayoutConstraintAxisHorizontal];
                        break;
                    case STMPriorityDefaultLow:
                        [xView setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
                        break;
                    case STMPriorityDefaultHigh:
                        [xView setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
                        break;
                    case STMPriorityRequired:
                        [xView setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
                        break;
                    default:
                        break;
                }
            }else {
                switch (partView.maker.compression) {
                    case STMPriorityFittingSizeLevel:
                        [xView setContentCompressionResistancePriority:UILayoutPriorityFittingSizeLevel forAxis:UILayoutConstraintAxisVertical];
                        break;
                    case STMPriorityDefaultLow:
                        [xView setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisVertical];
                        break;
                    case STMPriorityDefaultHigh:
                        [xView setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
                        break;
                    case STMPriorityRequired:
                        [xView setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
                        break;
                    default:
                        break;
                }
            }
        }

        //设置抗拉伸权重
        if (partView.maker.hugging != STMPriorityDefault) {
            if (assembleMaker.arrange == STMAssembleArrangeHorizontal) {
                switch (partView.maker.hugging) {
                    case STMPriorityFittingSizeLevel:
                        [xView setContentHuggingPriority:UILayoutPriorityFittingSizeLevel forAxis:UILayoutConstraintAxisHorizontal];
                        break;
                    case STMPriorityDefaultLow:
                        [xView setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
                        break;
                    case STMPriorityDefaultHigh:
                        [xView setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
                        break;
                    case STMPriorityRequired:
                        [xView setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
                        break;
                    default:
                        break;
                }
            }else {
                switch (partView.maker.hugging) {
                    case STMPriorityFittingSizeLevel:
                        [xView setContentHuggingPriority:UILayoutPriorityFittingSizeLevel forAxis:UILayoutConstraintAxisVertical];
                        break;
                    case STMPriorityDefaultLow:
                        [xView setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisVertical];
                        break;
                    case STMPriorityDefaultHigh:
                        [xView setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
                        break;
                    case STMPriorityRequired:
                        [xView setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
                        break;
                    default:
                        break;
                }
            }
        }
        
        CGFloat partViewMarginOffset = partMarker.alignmentMargin; //对齐时的partView设置的间距
        
        if (partMarker.size.width || partMarker.size.height || partMarker.partAlignment != STMPartAlignmentDefault) {
            //设置布局约束
            [xView mas_makeConstraints:^(MASConstraintMaker *make) {
                if (partMarker.partAlignment != STMPartAlignmentDefault) {
                    if (partMarker.partAlignment == STMPartAlignmentCenter) {
                        make.centerY.equalTo(self).offset(partViewMarginOffset);
                    } else if (partMarker.partAlignment == STMPartAlignmentTop) {
                        make.top.equalTo(self).offset(partViewMarginOffset?:assembleTopMargin);
                    } else if (partMarker.partAlignment == STMPartAlignmentBottom) {
                        make.bottom.equalTo(self).offset(-partViewMarginOffset?-partViewMarginOffset:-assembleBottomMargin);
                    } else if (partMarker.partAlignment == STMPartAlignmentLeft) {
                        make.left.equalTo(self).offset(partViewMarginOffset?:assembleLeftMargin);
                    } else if (partMarker.partAlignment == STMPartAlignmentRight) {
                        make.right.equalTo(self).offset(partViewMarginOffset?-partViewMarginOffset:-assembleRightMargin);
                    }
                }
                //大小
                if (partMarker.size.width > 0) {
                    make.width.mas_equalTo(partMarker.size.width);
                }
                
                if (partMarker.size.height > 0) {
                    make.height.mas_equalTo(partMarker.size.height);
                }
                
                //lessThanOrEqualTo和greaterThanOrEqualTo的设置
                if (partView.maker.minWidth > 0) {
                    make.width.greaterThanOrEqualTo(@(partView.maker.minWidth));
                }
                
                if (partView.maker.maxWidth > 0) {
                    make.width.lessThanOrEqualTo(@(partView.maker.maxWidth));
                }
                
                if (partView.maker.minHeight > 0) {
                    make.height.greaterThanOrEqualTo(@(partView.maker.minWidth));
                }
                
                if (partView.maker.maxHeight > 0) {
                    make.height.lessThanOrEqualTo(@(partView.maker.maxWidth));
                }
               
            }];
        }
        
        lastView = xView;
    }
     
    return self;
}

+ (IMYAdAssembleView *)createViewWithDict:(NSDictionary*)viewDict
{
    NSDictionary* dic = [viewDict objectForKey:@"assemble"];
    if ([dic isKindOfClass:[NSDictionary class]]) {
        IMYAdAssembleView *adView = [IMYAdAssembleView createView:^(IMYAdAssembleMaker *make) {
            
            CGFloat width = 0;
            CGFloat height = 0;
            NSArray *keyArray = [dic allKeys];
            for (int i = 0 ; i < keyArray.count; i++) {
                NSString *key = [keyArray objectAtIndex:i];
                if ([key assemble_equalToString:@"width"]) {
                    width = [dic[key] floatValue];
                }
                if ([key assemble_equalToString:@"height"]) {
                    height = [dic[key] floatValue];
                }
                if (width > 0 || height > 0) {
                    make.sizeEqualTo(CGSizeMake(width, height));
                }
                [[self class] parsingCommonMarker:make viewDict:dic key:key];
                
                if ([key assemble_equalToString:@"partview"]) {
                    NSArray *partViewArray = [dic objectForKey:key];
                    if ([partViewArray isKindOfClass:[NSArray class]]) {
                        for (NSDictionary *partViewDict in partViewArray) {
                            NSDictionary* assembleDict = [partViewDict objectForKey:@"assemble"];
                            if ([assembleDict isKindOfClass:[NSDictionary class]]) {
                                make.addView([self createViewWithDict:partViewDict]);
                            }else {
                                make.addView([self creatPartViewWithDict:partViewDict]);
                            }
                        }
                    }
                }
            }
        }];
        return adView;
    }
    return nil;
}

+ (IMYAdPartView *)creatPartViewWithDict:(NSDictionary*)dic
{
    return [IMYAdPartView createView:^(IMYAdPartMaker *make) {
        NSArray *keyArray = [dic allKeys];
        CGFloat width = 0;
        CGFloat height = 0;
        for (int i = 0 ; i < keyArray.count; i++) {
            NSString *key = [keyArray objectAtIndex:i];
            
            if ([key assemble_equalToString:@"width"]) {
                width = [dic[key] floatValue];
            }
            if ([key assemble_equalToString:@"height"]) {
                height = [dic[key] floatValue];
            }
            if (width > 0 || height > 0) {
                make.sizeEqualTo(CGSizeMake(width, height));
            }
            [self parsingCommonMarker:make viewDict:dic key:key];
            
            //处理多个值需要组合的情况
            if ([key assemble_equalToString:@"isFill"]) {
                if ([dic[key] integerValue] > 0) {
                    make.isFillEqualTo(YES);
                } else {
                    make.isFillEqualTo(NO);
                }
            }
    
            //设置抗压缩权重
            if ([key assemble_equalToString:@"compression"]) {
                if ([dic[key] assemble_equalToString:@"fit"]) {
                    make.compressionEqualTo(STMPriorityFittingSizeLevel);
                }
                if ([dic[key] assemble_equalToString:@"low"]) {
                    make.compressionEqualTo(STMPriorityDefaultLow);
                }
                if ([dic[key] assemble_equalToString:@"high"]) {
                    make.compressionEqualTo(STMPriorityDefaultHigh);
                }
                if ([dic[key] assemble_equalToString:@"required"]) {
                    make.compressionEqualTo(STMPriorityRequired);
                }
            }
            
            //设置抗拉伸权重
            if ([key assemble_equalToString:@"hugging"]) {
                if ([dic[key] assemble_equalToString:@"fit"]) {
                    make.huggingEqualTo(STMPriorityFittingSizeLevel);
                }
                if ([dic[key] assemble_equalToString:@"low"]) {
                    make.huggingEqualTo(STMPriorityDefaultLow);
                }
                if ([dic[key] assemble_equalToString:@"high"]) {
                    make.huggingEqualTo(STMPriorityDefaultHigh);
                }
                if ([dic[key] assemble_equalToString:@"required"]) {
                    make.huggingEqualTo(STMPriorityRequired);
                }
            }
            
            //设置最大，最小宽
            if ([key assemble_equalToString:@"minWidth"]) {
                make.minWidthEqualTo([dic[key] floatValue]);
            }
            if ([key assemble_equalToString:@"maxWidth"]) {
                make.maxWidthEqualTo([dic[key] floatValue]);
            }
            if ([key assemble_equalToString:@"minHeight"]) {
                make.minHeightEqualTo([dic[key] floatValue]);
            }
            if ([key assemble_equalToString:@"maxHeight"]) {
                make.maxHeightEqualTo([dic[key] floatValue]);
            }
            
            //设置控件通用
            if ([key assemble_equalToString:@"backColor"]) {
                 make.backColorHexStringIs(dic[key]);
            }
            if ([key assemble_equalToString:@"backPaddingHorizontal"]) {
                make.backPaddingHorizontalIs([dic[key] floatValue]);
            }
            if ([key assemble_equalToString:@"backPaddingVertical"]) {
                make.backPaddingVerticalIs([dic[key] floatValue]);
            }
            if ([key assemble_equalToString:@"backBorderColor"]) {
                if ([dic[key] isKindOfClass:[UIColor class]]) {
                    UIColor *pColor = (UIColor *)dic[key];
                    make.backBorderColorIs(pColor);
                } else {
                    make.backBorderColorHexStringIs(dic[key]);
                }
            }
//            if ([key assemble_equalToString:@"backBorderColorHexString"]) {
//                make.backBorderColorHexStringIs(dic[key]);
//            }
            if ([key assemble_equalToString:@"backBorderWidth"]) {
                make.backBorderWidthIs([dic[key] floatValue]);
            }
            if ([key assemble_equalToString:@"backBorderRadius"] || [key assemble_equalToString:@"radius"]) {
                make.backBorderRadiusIs([dic[key] floatValue]);
            }
            //标签文字
            if ([key assemble_equalToString:@"text"]) {
                make.textIs(dic[key]);
            }
            if ([key assemble_equalToString:@"fontSize"]) {
                make.fontSizeIs([dic[key] floatValue]);
            }
            if ([key assemble_equalToString:@"color"]) {
                make.colorHexStringIs(dic[key]);
            }
            if ([key assemble_equalToString:@"numberOfLines"]) {
                make.numberOfLinesIs([dic[key] integerValue]);
            }
            if ([key assemble_equalToString:@"horizontalAlignment"]) {
                if ([dic[key] assemble_equalToString:@"left"]) {
                    make.textHorizontalAlignmentIs(NSTextAlignmentLeft);
                }
                if ([dic[key] assemble_equalToString:@"right"]) {
                    make.textHorizontalAlignmentIs(NSTextAlignmentRight);
                }
                if ([dic[key] assemble_equalToString:@"center"]) {
                    make.textHorizontalAlignmentIs(NSTextAlignmentCenter);
                }
            }
            if ([key assemble_equalToString:@"verticalAlignment"]) {
                if ([dic[key] assemble_equalToString:@"top"]) {
                    make.textVerticalAlignmentIs(STMPartTextVerticalAlignmentTop);
                }
                if ([dic[key] assemble_equalToString:@"bottom"]) {
                    make.textVerticalAlignmentIs(STMPartTextVerticalAlignmentBottom);
                }
            }
        
            //图片
            if ([key assemble_equalToString:@"imageName"]) {
                 make.imageNameIs(dic[key]);
            }
            if ([key assemble_equalToString:@"imageUrl"]) {
                  make.imageUrlIs(dic[key]);
            }
            //视频
            if ([key assemble_equalToString:@"videoUrl"]) {
                make.videoUrlIs(dic[key]);
            }
           
            //按钮
            if ([key assemble_equalToString:@"btnNormalImage"]) {
                make.btnNormalImageIs(dic[key]);
            }
            if ([key assemble_equalToString:@"btnHighLightlImage"]) {
                make.btnHighLightlImageIs(dic[key]);
            }
            if ([key assemble_equalToString:@"btnDisableImage"]) {
                make.btnDisableImageIs(dic[key]);
            }
            if ([key assemble_equalToString:@"btnType"]) {
                
            }
        }
    }];
}

+ (void)parsingCommonMarker:(IMYAdMaker*)make viewDict:(NSDictionary*)dic key:(NSString*)key
{
    if ([key assemble_equalToString:@"arrange"]) {
        if ([dic[key] assemble_equalToString:@"vertical"]) {
            make.arrangeEqualTo(STMAssembleArrangeVertical);
        }
        if ([dic[key] assemble_equalToString:@"horizontal"]) {
            make.arrangeEqualTo(STMAssembleArrangeHorizontal);
        }
    }
    if ([key assemble_equalToString:@"alignment"]) {
        if ([dic[key] assemble_equalToString:@"center"]) {
            make.alignmentEqualTo(STMAssembleAlignmentCenter);
        }
        if ([dic[key] assemble_equalToString:@"left"]) {
            make.alignmentEqualTo(STMAssembleAlignmentLeft);
        }
        if ([dic[key] assemble_equalToString:@"right"]) {
            make.alignmentEqualTo(STMAssembleAlignmentRight);
        }
        if ([dic[key] assemble_equalToString:@"top"]) {
            make.alignmentEqualTo(STMAssembleAlignmentTop);
        }
        if ([dic[key] assemble_equalToString:@"bottom"]) {
            make.alignmentEqualTo(STMAssembleAlignmentBottom);
        }
    }
    if ([key assemble_equalToString:@"distribution"]) {
        if ([dic[key] assemble_equalToString:@"fill"]) {
            make.distributionEqualTo(STMAssembleDistributionFill);
        }
        if ([dic[key] assemble_equalToString:@"fillEqually"]) {
            make.distributionEqualTo(STMAssembleADistributionFillEqually);
        }
        if ([dic[key] assemble_equalToString:@"fillProportionally"]) {
            make.distributionEqualTo(STMAssembleDistributionFillProportionally);
        }
        if ([dic[key] assemble_equalToString:@"equalSpacing"]) {
            make.distributionEqualTo(STMAssembleDistributionEqualSpacing);
        }
        if ([dic[key] assemble_equalToString:@"equalCentering"]) {
            make.distributionEqualTo(STMAssembleDistributionEqualCentering);
        }
    }
    
    if ([key assemble_equalToString:@"padding"]) {
        make.paddingEqualTo([dic[key] floatValue]);
    }
    
    if ([key assemble_equalToString:@"partAlignment"]) {
        if ([dic[key] assemble_equalToString:@"center"]) {
            make.partAlignmentEqualTo(STMPartAlignmentCenter);
        }
        if ([dic[key] assemble_equalToString:@"left"]) {
            make.partAlignmentEqualTo(STMPartAlignmentLeft);
        }
        if ([dic[key] assemble_equalToString:@"right"]) {
            make.partAlignmentEqualTo(STMPartAlignmentRight);
        }
        if ([dic[key] assemble_equalToString:@"top"]) {
            make.partAlignmentEqualTo(STMPartAlignmentTop);
        }
        if ([dic[key] assemble_equalToString:@"bottom"]) {
            make.partAlignmentEqualTo(STMPartAlignmentBottom);
        }
    }
    
    if ([key assemble_equalToString:@"alignmentMargin"]) {
        make.alignmentMarginEqualTo([dic[key] floatValue]);
    }
    
    if ([key assemble_equalToString:@"leftMargin"]) {
        make.leftMarginEqualTo([dic[key] floatValue]);
    }
    if ([key assemble_equalToString:@"rightMargin"]) {
        make.rightMarginEqualTo([dic[key] floatValue]);
    }
    if ([key assemble_equalToString:@"topMargin"]) {
        make.topMarginEqualTo([dic[key] floatValue]);
    }
    if ([key assemble_equalToString:@"bottomMargin"]) {
        make.bottomMarginEqualTo([dic[key] floatValue]);
    }
}

@end

