//
//  IMYAdMaker.m
//  UIViewKit
//
//  Created by 戴惠香 on 2019/5/6.
//  Copyright © 2019 戴惠香. All rights reserved.
//

#import "IMYAdMaker.h"

@implementation IMYAdMaker

#pragma mark - assemble marker

- (IMYAdMaker *(^)(CGSize))sizeEqualTo {
    return ^IMYAdMaker *(CGSize size) {
        self.size = size;
        return self;
    };
}

- (IMYAdMaker *(^)(CGFloat))paddingEqualTo {
    return ^IMYAdMaker *(CGFloat value) {
        self.padding = value;
        return self;
    };
}
- (IMYAdMaker *(^)(STMAssembleAlignment))alignmentEqualTo {
    return ^IMYAdMaker *(STMAssembleAlignment alignment) {
        self.alignment = alignment;
        return self;
    };
}
- (IMYAdMaker *(^)(STMAssembleArrange))arrangeEqualTo {
    return ^IMYAdMaker *(STMAssembleArrange arrange) {
        self.arrange = arrange;
        return self;
    };
}

- (IMYAdMaker *(^)(STMAssembleDistribution))distributionEqualTo
{
    return ^IMYAdMaker *(STMAssembleDistribution distribution) {
        self.distribution = distribution;
        return self;
    };
}

- (IMYAdMaker *(^)(STMPartAlignment))partAlignmentEqualTo {
    return ^IMYAdMaker *(STMPartAlignment alignment) {
        self.partAlignment = alignment;
        return self;
    };
}

- (IMYAdMaker *(^)(CGFloat))alignmentMarginEqualTo {
    return ^IMYAdMaker *(CGFloat margin) {
        self.alignmentMargin = margin;
        return self;
    };
}
- (IMYAdMaker *(^)(CGFloat))leftMarginEqualTo
{
    return ^IMYAdMaker *(CGFloat margin) {
        self.leftMargin = margin;
        return self;
    };
}
- (IMYAdMaker *(^)(CGFloat))rightMarginEqualTo
{
    return ^IMYAdMaker *(CGFloat margin) {
        self.rightMargin = margin;
        return self;
    };
}
- (IMYAdMaker *(^)(CGFloat))topMarginEqualTo
{
    return ^IMYAdMaker *(CGFloat margin) {
        self.topMargin = margin;
        return self;
    };
}
- (IMYAdMaker *(^)(CGFloat))bottomMarginEqualTo
{
    return ^IMYAdMaker *(CGFloat margin) {
        self.bottomMargin = margin;
        return self;
    };
}
#pragma mark - partMarker

@end
