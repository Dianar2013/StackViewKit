//
//  IMYAdMaker.h
//  IMYAdAssembleViewKit
//
//  Created by 戴惠香 on 2019/5/6.
//  Copyright © 2019 戴惠香. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMYAdMarkerDefine.h"

@interface IMYAdMaker : NSObject
//属性
@property (nonatomic) CGSize size;
@property (nonatomic) CGFloat padding;                  //间隔距离
@property (nonatomic) STMAssembleAlignment alignment;   //对齐
@property (nonatomic) STMAssembleArrange arrange;       //水平还是垂直排列
@property (nonatomic) STMAssembleDistribution distribution;//填充方式
@property (nonatomic) STMPartAlignment partAlignment;   //不设置就按照外部的assembleView的设置来
@property (nonatomic) CGFloat alignmentMargin;          //对齐方向和assembleView的间距
@property (nonatomic) CGFloat leftMargin;
@property (nonatomic) CGFloat rightMargin;
@property (nonatomic) CGFloat topMargin;
@property (nonatomic) CGFloat bottomMargin;

//方法
- (IMYAdMaker *(^)(CGFloat))paddingEqualTo;
- (IMYAdMaker *(^)(STMAssembleAlignment))alignmentEqualTo;
- (IMYAdMaker *(^)(STMAssembleArrange))arrangeEqualTo;
- (IMYAdMaker *(^)(STMAssembleDistribution))distributionEqualTo;
- (IMYAdMaker *(^)(STMPartAlignment))partAlignmentEqualTo;
- (IMYAdMaker *(^)(CGFloat))alignmentMarginEqualTo;
- (IMYAdMaker *(^)(CGFloat))leftMarginEqualTo;
- (IMYAdMaker *(^)(CGFloat))rightMarginEqualTo;
- (IMYAdMaker *(^)(CGFloat))topMarginEqualTo;
- (IMYAdMaker *(^)(CGFloat))bottomMarginEqualTo;
- (IMYAdMaker *(^)(CGSize))sizeEqualTo;


#pragma mark - part marker

@end

