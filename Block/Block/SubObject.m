//
//  SubObject.m
//  Block
//
//  Created by whf on 17/7/23.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "SubObject.h"

@implementation SubObject

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)dealloc {
    NSLog(@"SubObject dealloc!");
}

@end
