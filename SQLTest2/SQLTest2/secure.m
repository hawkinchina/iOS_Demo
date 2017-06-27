//
//  secure.m
//  SQLTest2
//
//  Created by apple on 16/10/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "secure.h"
#import "IOTool.h"

@implementation secure

- (BOOL)userName:(NSString *)name password:(NSString *)password{
    IOTool *iotool = [[IOTool alloc] init];
    NSString *fileName = @"systemUsers";
    NSString *content = [iotool readFile:fileName];
    
    NSArray *userList = [content componentsSeparatedByString:@"\n"];
    for (int i = 0; i<userList.count; i++) {
        NSArray *userInfo = [userList[i] componentsSeparatedByString:@" "];
        if ([userInfo[0] isEqualToString:name]) {
            if ([password isEqualToString:userInfo[1]]) {
                return YES;
            }
        }
    }
    return NO;
}

- (void)addUser:(NSString *)userName password:(NSString *)password level:(NSString *)level{
    IOTool *iotool = [[IOTool alloc] init];
    NSString *fileName = @"systemUsers";
    NSString *content = [iotool readFile:fileName];
    content = [content stringByAppendingString:[NSString stringWithFormat:@"\n%@ %@ %@",userName,password,level]];
    [iotool writeFile:fileName content:content];
}

- (NSString *)readUserLevel:(NSString *)userName{
    
    IOTool *iotool = [[IOTool alloc] init];
    NSString *fileName = @"systemUsers";
    NSString *content = [iotool readFile:fileName];
    
    NSArray *userList = [content componentsSeparatedByString:@"\n"];
    for (int i = 0; i<userList.count; i++) {
        NSArray *userInfo = [userList[i] componentsSeparatedByString:@" "];
        if ([userInfo[0] isEqualToString:userName]) {
            return userInfo[2];
        }
    }
    return 0;
}

@end
