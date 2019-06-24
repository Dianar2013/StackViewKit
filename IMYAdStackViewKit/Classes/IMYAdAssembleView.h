//
//  IMYAdAssembleView.h
//  IMYAdAssembleViewKit
//
//  Created by 戴惠香 on 2019/5/5.
//  Copyright © 2019 戴惠香. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMYAdAssembleMaker.h"

@class IMYAdPartView;

@interface IMYAdAssembleView : UIStackView

@property (nonatomic, strong, readonly) IMYAdAssembleMaker *maker;

+ (IMYAdAssembleView *)createViewWithDict:(NSDictionary*)viewDict;

+ (IMYAdAssembleView *)createView:(void(^)(IMYAdAssembleMaker *make))assembleMaker;

@end

