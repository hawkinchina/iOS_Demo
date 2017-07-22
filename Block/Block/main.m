//
//  main.m
//  Block
//
//  Created by whf on 17/7/16.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "SuperBlock.h"
//#import "CopyBlock.h"
//#import "NoCopyBlock.h"

void fun(int a) {
    if (a == 1) {
        NSLog(@"a = %d",a);
        return;
    }
    a = a - 1;
    fun(a);
    NSLog(@"a = %d",a);
}

int a = 100;
void fun1() {
    if (a == 1) {
        NSLog(@"a = %d",a);
        return;
    }
    a = a - 1;
    fun1();
    NSLog(@"a = %d",a);
}

typedef int (^blk_t) (int a , int b);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
//        SuperBlock *blockO = [[CopyBlock alloc] init];
//        [blockO mainFunc];
//        
//        blockO = [[NoCopyBlock alloc] init];
//        [blockO mainFunc];
//        fun(100);
//        fun1();
        
        blk_t blk = ^ int (int a , int b) {
            return a + b;
        };
        
        int c = blk(1,2);
        NSLog(@"%d",c);
    }
    return 0;
}
