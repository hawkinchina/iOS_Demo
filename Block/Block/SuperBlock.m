//
//  SuperBlock.m
//  Block
//
//  Created by whf on 17/7/16.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "SuperBlock.h"

@implementation SuperBlock

- (void)mainFunc {
    NSLog(@"CLASS_NAME:%@ SEL_NAME:%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}

@end
