//
//  CopyBlock.m
//  Block
//
//  Created by whf on 17/7/16.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "CopyBlock.h"

@implementation CopyBlock

blk_t blk;

/**
 block 被 copy后会被从栈区复制到堆区，block引用的变量也会被复制到堆区,并且block会持有变量
 */
- (void)mainFunc {
    [super mainFunc];
    {
        id __strong array = [[NSMutableArray alloc] init];
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
