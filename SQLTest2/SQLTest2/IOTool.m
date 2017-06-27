//
//  IOTool.m
//  SQLTest2
//
//  Created by apple on 16/9/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "IOTool.h"

@implementation IOTool

- (void) multThread{
    //创建一个串行序列
    dispatch_queue_t serialQueue;
    serialQueue = dispatch_queue_create("serialQueue", DISPATCH_QUEUE_SERIAL);
    //并行序列
    dispatch_queue_t concurrentQueue;
    concurrentQueue = dispatch_queue_create("concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    //将代码块提交给串并行序列
    dispatch_async(concurrentQueue, ^{
        for (int i = 0; i < 100; i++) {
            NSLog(@"%@=====%d",[NSThread currentThread],i);
        }
    });
    
    dispatch_async(concurrentQueue, ^{
        for (int i = 0; i < 100; i++) {
            NSLog(@"%@-----%d",[NSThread currentThread],i);
        }
    });
    
}

- (void) writeFile:(NSString *)fileName content:(NSString *)content{
//    NSString *homeDirectory = NSHomeDirectory();
    
    //文件的写入
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    if (!docDir) {
        NSLog(@"Documents 目录未找到");
    }
    NSString *filePath = [docDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.txt",fileName]];
    NSLog(@"filePath : %@",filePath);
    
    [content writeToFile:filePath atomically:YES];
    
}

- (NSString *)readFile:(NSString *)fileName{
    //读取文件
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDirs = [path objectAtIndex:0];
    NSString *filePaths = [docDirs stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.txt",fileName]];
    
    NSString *content = [[NSString alloc] initWithContentsOfFile:filePaths encoding:NSUTF8StringEncoding error:nil];
    
    return content;
    
//    //fileManager
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSString *testDirectory = [docDirs stringByAppendingString:@"/test"];
//    [fileManager createDirectoryAtPath:testDirectory withIntermediateDirectories:YES attributes:nil error:
//     nil];
//    NSString *file1 = [testDirectory stringByAppendingString:@"/file1.text"];
//    NSString *file1Contents = @"xStore for IO test...";
//    [fileManager createFileAtPath:file1 contents:[file1Contents dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
}


@end
