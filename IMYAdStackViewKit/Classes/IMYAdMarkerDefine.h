//
//  IMYAdMarkerDefine.h
//  IMYAdAssembleViewKit
//
//  Created by 戴惠香 on 2019/5/6.
//  Copyright © 2019 戴惠香. All rights reserved.
//

#ifndef IMYAdMarkerDefine_h
#define IMYAdMarkerDefine_h

typedef NS_ENUM(NSUInteger, STMAssembleAlignment) {
    STMAssembleAlignmentCenter = 0,
    STMAssembleAlignmentLeft,
    STMAssembleAlignmentRight,
    STMAssembleAlignmentTop,
    STMAssembleAlignmentBottom
};
typedef NS_ENUM(NSUInteger, STMAssembleDistribution) {
    STMAssembleDistributionFill = 0,
    STMAssembleADistributionFillEqually,
    STMAssembleDistributionFillProportionally,
    STMAssembleDistributionEqualSpacing,
    STMAssembleDistributionEqualCentering
};

typedef NS_ENUM(NSUInteger, STMAssembleArrange) {
    STMAssembleArrangeHorizontal,
    STMAssembleArrangeVertical
};

typedef NS_ENUM(NSUInteger, STMPartAlignment) {
    STMPartAlignmentDefault,
    STMPartAlignmentCenter,
    STMPartAlignmentLeft,
    STMPartAlignmentRight,
    STMPartAlignmentTop,
    STMPartAlignmentBottom
};

typedef NS_ENUM(NSUInteger, STMPartColorType) {
    STMPartColorWhite,
    STMPartColorBlack,
    STMpartColorGray,
    STMpartColorLightGray,
    STMpartColorDarkGray,
    STMpartColorOrange,
    STMpartColorRed
};
//权重
typedef NS_ENUM(NSUInteger, STMPartPriority) {
    STMPriorityDefault,          //不设置，按照默认来
    STMPriorityFittingSizeLevel, //50
    STMPriorityDefaultLow,       //250
    STMPriorityDefaultHigh,      //750
    STMPriorityRequired,         //1000
};

typedef NS_ENUM(NSUInteger, STMPartTextVerticalAlignment) { //文本垂直方向对齐方式
    STMPartTextVerticalAlignmentDefault = 0,
    STMPartTextVerticalAlignmentTop,
    STMPartTextVerticalAlignmentBottom,
};


#endif /* IMYAdMarkerDefine_h */
