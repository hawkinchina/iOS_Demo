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

//void fun(int a) {
//    if (a == 1) {
//        NSLog(@"a = %d",a);
//        return;
//    }
//    a = a - 1;
//    fun(a);
//    NSLog(@"a = %d",a);
//}
//
//int a = 100;
//void fun1() {
//    if (a == 1) {
//        NSLog(@"a = %d",a);
//        return;
//    }
//    a = a - 1;
//    fun1();
//    NSLog(@"a = %d",a);
//}

typedef int (^blk_t) (int a , int b);
typedef void (^blk_t1) (void);

static int d3;
int d4;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        SuperBlock *blockO = [[CopyBlock alloc] init];
        [blockO mainFunc];
        
        blockO = [[NoCopyBlock alloc] init];
        [blockO mainFunc];
//        fun(100);
//        fun1();
        
        blk_t blk = ^ int (int a , int b) {
            return a + b;
        };
        
        int c = blk(1,2);
        NSLog(@"%d",c);
        
        //捕获局部变量
        int d = 10;
        blk_t1 blk1 = ^ {
            NSLog(@"%d",d);
        };
        d = 11;
        blk1();
        
        //修改局部变量
        __block int d1 = 10;
        blk_t1 blk2 = ^ {
            d1 = 12;
            NSLog(@"%d",d1);
        };
        blk2();
        NSLog(@"%d",d1);
        
        //修改静态变量
        static int d2 = 10;
        blk_t1 blk3 = ^ {
            d2 = 13;
            NSLog(@"%d",d2);
        };
        blk3();
        NSLog(@"%d",d2);
        
        //修改静态全局变量
        blk_t1 blk4 = ^ {
            d3 = 14;
            NSLog(@"%d",d3);
        };
        blk4();
        NSLog(@"%d",d3);
        
        //修改全局变量
        blk_t1 blk5 = ^ {
            d4 = 15;
            NSLog(@"%d",d4);
        };
        blk5();
        NSLog(@"%d",d4);
        
        //产生循环引用 导致内存泄露
        CopyBlock *copyBlock = [[CopyBlock alloc] init];
        blk_t3 blk6 = ^ (id obj){
            NSLog(@"%@",copyBlock);
        };
        copyBlock.blk = [blk6 copy];
        
    }
    return 0;
}
