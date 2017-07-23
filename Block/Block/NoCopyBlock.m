//
//  NoCopyBlock.m
//  Block
//
//  Created by whf on 17/7/16.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "NoCopyBlock.h"

@implementation NoCopyBlock

/**
 block 没有被copy到堆区，因为array没有持有NSMutableArray对象，出了作用域后NSMutableArray对象被释放，block无法使用该对象，导致获取到的对象为空
 */
- (void)mainFunc {
    [super mainFunc];
    blk_t0 blk1;
    {
        id __weak array = [[NSMutableArray alloc] init];
        blk1 = ^(id obj){
            [array addObject:obj];
            NSLog(@"array count is : %lu",(unsigned long)[array count]);
            if ([array count] > 1) {
                NSLog(@"object at index : %lu is %@",[array count]-2,array[[array count] - 2]);
            }
        };
    }
    blk1([[NSString alloc] initWithString:@"1"]);
    blk1([[NSString alloc] initWithString:@"2"]);
    blk1([[NSString alloc] initWithString:@"3"]);
    blk1([[NSString alloc] initWithString:@"4"]);

}

@end
