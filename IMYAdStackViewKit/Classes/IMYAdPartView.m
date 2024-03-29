//
//  IMYAdPartView.m
//  IMYAdAssembleViewKit
//
//  Created by 戴惠香 on 2019/5/5.
//  Copyright © 2019 戴惠香. All rights reserved.
//

#import "IMYAdPartView.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"
#import "IMYAdLabel.h"

@implementation IMYAdPartView

+ (IMYAdPartView *)createView:(void(^)(IMYAdPartMaker *))partMaker {
    IMYAdPartView *partView = [[self alloc] init];
    partView.maker = [[IMYAdPartMaker alloc] init];
    partMaker(partView.maker);
    [partView buildPartView];
    return partView;
}

- (IMYAdPartView *)buildPartView {
    if (self.maker.image) {
        
        if (self.maker.view) {
            if ([self.maker.view isKindOfClass:[UIImageView class]]) {
                UIImageView *fiv = (UIImageView *)self.maker.view;
                [self updateImageView:fiv];
            }
        } else {
            UIImageView *iv = [[UIImageView alloc] init];
            [self updateImageView:iv];
            self.maker.view = iv;
        }
        
    } else if (self.maker.text.length > 0 || self.maker.font) {
        
        if (self.maker.view) {
            if ([self.maker.view isKindOfClass:[IMYAdLabel class]]) {
                IMYAdLabel *fLb = (IMYAdLabel *)self.maker.view;
                [self updateLabel:fLb];
            }
        } else {
            IMYAdLabel *lb = [[IMYAdLabel alloc] init];
            [self updateLabel:lb];
            self.maker.view = lb;
        }
        
    }
    
    //处理有背景的情况
    if (self.maker.backColor || self.maker.backPaddingVertical || self.maker.backPaddingHorizontal) {
        UIView *backView = [[UIView alloc] init];
        if (self.maker.backColor) {
            backView.backgroundColor = self.maker.backColor;
        } else {
            backView.backgroundColor = [UIColor clearColor];
        }
        
        UIView *oView = self.maker.view;
        CGFloat paddingV = self.maker.backPaddingVertical;
        CGFloat paddingH = self.maker.backPaddingHorizontal;
        
        [backView addSubview:oView];
        if (paddingH > 0 || paddingV > 0) {
            [oView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(backView).offset(paddingH);
                make.right.equalTo(backView).offset(-paddingH);
                make.top.equalTo(backView).offset(paddingV);
                make.bottom.equalTo(backView).offset(-paddingV);
            }];
        } else {
            [oView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(backView);
            }];
        }
        
        
        //设置边线
        if (self.maker.backBorderColor) {
            backView.layer.borderColor = self.maker.backBorderColor.CGColor;
        }
        if (self.maker.backBorderWidth > 0) {
            backView.layer.borderWidth = self.maker.backBorderWidth;
        }
        if (self.maker.backBorderRadius > 0) {
            backView.layer.cornerRadius = self.maker.backBorderRadius;
        }
        
        self.maker.view = backView;
    }
    
    //处理有button的情况
    if (self.maker.button) {
        [self.maker.view addSubview:self.maker.button];
        if (self.maker.buttonHighlightColor) {
            //点击效果
            [self.maker.button setBackgroundImage:[self imageWithColor:self.maker.buttonHighlightColor] forState:UIControlStateHighlighted];
        } else {
            [self.maker.button setBackgroundImage:[self imageWithColor:[[IMYAdPartMaker colorWithHexString:@"000000"] colorWithAlphaComponent:0.05]] forState:UIControlStateHighlighted];
        }
        [self.maker.button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.equalTo(self.maker.view);
        }];
    }
    
    return self;
}

- (void)updateLabel:(IMYAdLabel *)label {
    label.text = self.maker.text;
    label.textColor = self.maker.color;
    label.font = self.maker.font;
    label.numberOfLines = self.maker.numberOfLines;
    label.textAlignment = self.maker.textHorizontalAlignment;
    switch (self.maker.textVerticalAlignment) {
        case STMPartTextVerticalAlignmentDefault:
            [label setVerticalAlignment:VerticalAlignmentDefault];
            break;
        case STMPartTextVerticalAlignmentTop:
             [label setVerticalAlignment:VerticalAlignmentTop];
            break;
        case STMPartTextVerticalAlignmentBottom:
            [label setVerticalAlignment:VerticalAlignmentBottom];
            break;
        default:
            break;
    }
}
- (void)updateImageView:(UIImageView *)imageView {
    if(self.maker.imageUrl.length > 0) {
        [imageView sd_setImageWithURL:[NSURL URLWithString:self.maker.imageUrl] placeholderImage:self.maker.imagePlaceholder];
    } else {
        [imageView setImage:self.maker.image];
    }
}

#pragma mark - helper
//辅助方法
- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end

