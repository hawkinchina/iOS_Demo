//
//  main.m
//  SQLTest2
//
//  Created by apple on 16/9/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputManger.h"
#import "IOTool.h"
#import "secure.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        InputManger *inputManager = [[InputManger alloc] init];
        
        secure *door = [[secure alloc] init];
        
        NSLog(@"******登录数据库系统******");
        NSLog(@"******请您登录*******");
        
        BOOL hasLogin = NO;
        
        char str[100];
        gets(str);
        NSString *input = [NSString stringWithUTF8String:str];
        NSArray *inputArr = [input componentsSeparatedByString:@" "];
        
        //login <name> password <password>
        if ([inputArr[0] isEqualToString:@"login"]) {
            hasLogin = [door userName:inputArr[1] password:inputArr[3]];
            if (hasLogin) {
                NSLog(@"登录成功");
                
                inputManager.nowUser = [[[secure alloc] init] readUserLevel:inputArr[1]];
                
                char str[100];
                gets(str);
                NSString *input = [NSString stringWithUTF8String:str];
                NSArray *inputArr = [input componentsSeparatedByString:@" "];
                //addUser <name> password <password> level <level>
                if ([inputArr[0] isEqualToString:@"addUser"]) {
                    [door addUser:inputArr[1] password:inputArr[3] level:inputArr[5]];
                    NSLog(@"添加成功");
                }
            }
            else{
                NSLog(@"登录失败");
            }
        }
        
      
        
        while (1) {
            char str[100];
            gets(str);
            NSString *input = [NSString stringWithUTF8String:str];
            [inputManager handleInput:input];
            fflush(stdin);
        }
        
    }
    return 0;
}


