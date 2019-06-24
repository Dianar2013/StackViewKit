//
//  NSString+Assemble.m
//  IMYAdAssembleViewKit
//
//  Created by 戴惠香 on 2019/5/6.
//  Copyright © 2019 戴惠香. All rights reserved.
//

#import "NSString+Assemble.h"

@implementation NSString(Assemble)

- (BOOL)assemble_equalToString:(NSString*)str
{
    if (!str) {
        return NO;
    }
    return [self caseInsensitiveCompare:str] == NSOrderedSame;
}

@end
