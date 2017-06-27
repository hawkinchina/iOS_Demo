//
//  ViewController.m
//  MulThread
//
//  Created by whf on 17/3/3.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (assign) NSInteger aa;
@end

@implementation ViewController{
    int a,b,c;
}

- (instancetype)init{
    self = [super init];
    a=b=c=0;
    _aa = 0;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(thread1) object:self];
    NSThread *thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(thread2) object:self];
    [thread1 start];
    [thread2 start];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)thread1{
    
    for (int i=0; i<100; i++) {
        [NSThread sleepForTimeInterval:0.01];
        @synchronized (self) {
            _aa++;
            printf("thread1:%ld\n",(long)_aa);
        }
    }
}
- (void)thread2{
    for (int i =0; i<100; i++) {
        [NSThread sleepForTimeInterval:0.01];
        @synchronized (self) {
            _aa++;
            printf("thread2:%ld\n",(long)_aa);
        }
    }
}


@end
