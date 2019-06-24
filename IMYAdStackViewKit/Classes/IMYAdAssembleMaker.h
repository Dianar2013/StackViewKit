//
//  IMYAdAssembleMaker.h
//  IMYAdAssembleViewKit
//
//  Created by 戴惠香 on 2019/5/5.
//  Copyright © 2019 戴惠香. All rights reserved.
//

#import "IMYAdMaker.h"

@class IMYAdAssembleView;

@interface IMYAdAssembleMaker : IMYAdMaker

@property (nonatomic, strong) NSMutableArray *subViews; //存放所有子视图

//方法
- (IMYAdAssembleMaker *(^)(NSObject *))addView;

@end
