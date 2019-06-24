//
//  IMYAdPartView.h
//  IMYAdAssembleViewKit
//
//  Created by 戴惠香 on 2019/5/5.
//  Copyright © 2019 戴惠香. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMYAdPartMaker.h"

@interface IMYAdPartView : NSObject

@property (nonatomic, strong) IMYAdPartMaker *maker;

+ (IMYAdPartView *)createView:(void(^)(IMYAdPartMaker *make))partMaker;

@end
