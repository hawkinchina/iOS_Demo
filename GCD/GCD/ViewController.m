//
//  ViewController.m
//  GCD
//
//  Created by whf on 17/7/1.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
//    [self concurrentQueue];
    [self serialQueue];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

- (void) concurrentQueue {
    int j = 0;
    __block int i = 0;
    dispatch_queue_t queue = dispatch_queue_create("_whf", DISPATCH_QUEUE_CONCURRENT);
    for (; j < 1000; j++) {
        dispatch_async(queue, ^{
            i ++;
            NSLog(@"seq:%d    i: %d",j,i);
        });
    }
}

- (void) serialQueue {
    int j = 0;
    __block int i = 0;
    for (; j < 1000; j++) {
        const char *qName  = [[NSString stringWithFormat:@"whf%d",j] cStringUsingEncoding:NSUTF8StringEncoding];
        dispatch_queue_t queue = dispatch_queue_create(qName, DISPATCH_QUEUE_SERIAL);
        dispatch_async(queue, ^{
            i ++;
            NSLog(@"seq:%d    i: %d",j,i);
            while (1) {
                
            }
        });
    }
}

@end
