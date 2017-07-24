//
//  SuperBlock.m
//  Block
//
//  Created by whf on 17/7/16.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "SuperBlock.h"

@implementation SuperBlock

- (instancetype)init {
    if (self = [super init]) {
        self.subObject = [[SubObject alloc] init];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"SuperBlock dealloc!");
}

- (void)mainFunc {
    NSLog(@"CLASS_NAME:%@ SEL_NAME:%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}

@end
