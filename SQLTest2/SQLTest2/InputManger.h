//
//  InputManger.h
//  SQLTest2
//
//  Created by apple on 16/9/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputManger : NSObject

@property (strong, nonatomic) NSString *nowUser;

- (void)handleInput:(NSString *)input;

@end
