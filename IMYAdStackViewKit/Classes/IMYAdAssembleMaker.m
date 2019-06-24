//
//  IMYAdAssembleMaker.m
//  IMYAdAssembleViewKit
//
//  Created by 戴惠香 on 2019/5/5.
//  Copyright © 2019 戴惠香. All rights reserved.
//

#import "IMYAdAssembleMaker.h"
#import "IMYAdAssembleView.h"

@implementation IMYAdAssembleMaker

- (IMYAdAssembleMaker *(^)(NSObject *))addView {
    return ^IMYAdAssembleMaker *(NSObject *view) {
        [self.subViews addObject:view];
        return self;
    };
}

#pragma mark - Getter
- (NSMutableArray *)subViews {
    if (!_subViews) {
        _subViews = [NSMutableArray array];
    }
    return _subViews;
}

@end
