//
//  main.m
//  Block
//
//  Created by whf on 17/7/16.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SuperBlock.h"
#import "CopyBlock.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        SuperBlock *blockO = [[CopyBlock alloc] init];
        [blockO mainFunc];
    }
    return 0;
}
