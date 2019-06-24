//
//  IMYAdLabel.h
//  IMYAdStackViewKit
//
//  Created by 戴惠香 on 2019/6/13.
//  Copyright © 2019 戴惠香. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum
{
    VerticalAlignmentDefault = 0, //
    VerticalAlignmentTop,
    VerticalAlignmentBottom
    
} VerticalAlignment;

@interface IMYAdLabel : UILabel{
    
@private
    VerticalAlignment _verticalAlignment;
}

@property (nonatomic) VerticalAlignment verticalAlignment;

#pragma mark -- 设置文字居中还是靠近顶端还是接近底部显示
- (void)setVerticalAlignment:(VerticalAlignment)verticalAlignment;
@end


NS_ASSUME_NONNULL_END
