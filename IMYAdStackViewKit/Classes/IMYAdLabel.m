//
//  IMYAdLabel.m
//  IMYAdStackViewKit
//
//  Created by 戴惠香 on 2019/6/13.
//  Copyright © 2019 戴惠香. All rights reserved.
//

#import "IMYAdLabel.h"

@implementation IMYAdLabel

@synthesize verticalAlignment = verticalAlignment_;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.verticalAlignment = VerticalAlignmentDefault;
    }
    return self;
}

- (void)setVerticalAlignment:(VerticalAlignment)verticalAlignment{
    
    verticalAlignment_ = verticalAlignment;
    [self setNeedsDisplay];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines{
    
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (self.verticalAlignment) {
        case VerticalAlignmentTop:
            textRect.origin.y = bounds.origin.y;
            break;
        case VerticalAlignmentBottom:
            textRect.origin.y = bounds.origin.y +bounds.size.height - textRect.size.height;
            break;
        default:
            break;
    }
    return textRect;
}

- (void)drawTextInRect:(CGRect)requestRect{
    
    if (self.verticalAlignment == VerticalAlignmentDefault)
    {
        [super drawTextInRect:requestRect];
    }else {
        CGRect actualRect = [self textRectForBounds:requestRect limitedToNumberOfLines:self.numberOfLines];
        [super drawTextInRect:actualRect];
    }
}


@end
