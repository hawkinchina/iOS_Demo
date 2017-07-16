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
#import "NoCopyBlock.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        SuperBlock *blockO = [[CopyBlock alloc] init];
        [blockO mainFunc];
        
        blockO = [[NoCopyBlock alloc] init];
        [blockO mainFunc];
    }
    return 0;
}