//
//  IOTool.h
//  SQLTest2
//
//  Created by apple on 16/9/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IOTool : NSObject

- (void) multThread;
- (void) sandBox;
- (void) writeFile:(NSString *)fileName content:(NSString *)content;
- (NSString *)readFile:(NSString *)fileName;
@end
