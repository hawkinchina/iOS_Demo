//
//  CopyBlock.m
//  Block
//
//  Created by whf on 17/7/16.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "CopyBlock.h"
typedef void (^blk_t)(id obj);
blk_t blk;
@implementation CopyBlock

/**
 block 被 使用copy后会被从栈区复制到堆区，block引用的变量也会被复制到堆区
 */
- (void)mainFunc {
    {
        id array = [[NSMutableArray alloc] init];
        blk = [^(id obj){
            [array addObject:obj];
            NSLog(@"array count is : %lu",(unsigned long)[array count]);
            if ([array count] > 1) {
                NSLog(@"object at index : %lu is %@",[array count]-2,array[[array count] - 2]);
            }
        } copy];
    }
    blk([[NSString alloc] initWithString:@"1"]);
    blk([[NSString alloc] initWithString:@"2"]);
    blk([[NSString alloc] initWithString:@"3"]);
    blk([[NSString alloc] initWithString:@"4"]);
}

@end
