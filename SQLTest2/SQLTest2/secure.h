//
//  secure.h
//  SQLTest2
//
//  Created by apple on 16/10/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface secure : NSObject

- (BOOL)userName:(NSString *)name password:(NSString *)password;
- (void)addUser:(NSString *)userName password:(NSString *)password level:(NSString *)level;
- (NSString *)readUserLevel:(NSString *)userName;
@end
