//
//  InputManger.m
//  SQLTest2
//
//  Created by apple on 16/9/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "InputManger.h"

#import "IOTool.h"


@implementation InputManger


- (void)handleInput:(NSString *)input{
    
    NSString *command = [input componentsSeparatedByString:@" "][0];
    command = [NSString stringWithFormat:@"%@ %@",command,[input componentsSeparatedByString:@" "][1]];
    
    /**
     *  在switch中不能声明OC特有类型
     */
    NSString *fileName;
    NSString *content;
    NSString *content_system;
    NSMutableArray *arr;
    NSString *par;
    NSArray *singlePar;
    
    IOTool *ioTool = [[IOTool alloc] init];
    
    
    switch ([self convert:command]) {
        case 0://CREATE TABLE
            
            fileName = [input componentsSeparatedByString:@" "][2];
            printf("请输入数据项：\n");
            char str[100];
            gets(str);
            input = [NSString stringWithUTF8String:str];
            input = [fileName stringByAppendingPathComponent:input];
            [ioTool writeFile:fileName content:@""];
            fileName = [fileName stringByAppendingString:@"_system"];
            [ioTool writeFile:fileName content:input];
            
            break;
        case 1://insert into
        {
            
            if (![self canOperate]) {
                return;
            }
            
            fileName = [input componentsSeparatedByString:@" "][2];
            content = [ioTool readFile:fileName];
            NSLog(@"%@",content);
            
            char str1[100];
            gets(str1);
            input = [NSString stringWithUTF8String:str1];
            input = [@"\n" stringByAppendingString:input];
            
            NSArray *inputArr = [input componentsSeparatedByString:@" "];
            if (![self isNum:inputArr[0]]) {
                NSLog(@"插入失败！主键非数字！");
                break;
            }
            NSArray *contentArr = [content componentsSeparatedByString:@"\n"];
            for (int i = 0; i<contentArr.count; i++) {
                NSString *mainKey = [contentArr[i] componentsSeparatedByString:@" "][0];
                
               NSString *insertKey = [inputArr[0] componentsSeparatedByString:@"\n"][1];
                if ([mainKey isEqualToString:insertKey]) {
                    NSLog(@"插入失败！主键重复！");
                    return;
                }
            }
            
            content = [content stringByAppendingString:input];
            [ioTool writeFile:fileName content:content];
            break;
        }
        
            
        case 2://delete from
            
            if (![self canOperate]) {
                return;
            }
            
            fileName = [input componentsSeparatedByString:@" "][2];
            content = [ioTool readFile:fileName];
            
            content_system = [ioTool readFile:[fileName stringByAppendingString:@"_system"]];
            NSLog(@"%@",content);
            arr = [NSMutableArray arrayWithArray:[content componentsSeparatedByString:@"\n"]];
            
            par = [input componentsSeparatedByString:@" "][4];
            singlePar = [content_system componentsSeparatedByString:@","];
            int index = 0;
            for (int i = 0; i<singlePar.count; i++) {
                NSString *tem = [singlePar[i] componentsSeparatedByString:@"[] "][1];
                if ([tem isEqualToString:par]) {
                    index = i;
                }
            }
            
            par = [input componentsSeparatedByString:@" "][5];
            for (int i = 0; i<arr.count; i++) {
                NSArray *tem = [arr[i] componentsSeparatedByString:@" "];
                NSString *item = [NSString stringWithFormat:@"%@",tem[index]];
                if ([item isEqualToString:par]) {
                    [arr removeObjectAtIndex:i];
                }
            }
            
            content = @"\n";
            for (int i = 0; i<arr.count; i++) {
                if ([arr[i] isEqualToString:@""]) {
                    continue;
                }
                content = [content stringByAppendingString:arr[i]];
                content = [content stringByAppendingString:@"\n"];
            }
            
            [ioTool writeFile:fileName content:content];
            break;
        
        case 4://alert new _name _items
            fileName = [input componentsSeparatedByString:@" "][2];
            content_system = [ioTool readFile:[fileName stringByAppendingString:@"_system"]];
            content = [content_system stringByAppendingString:[input componentsSeparatedByString:@" "][3]];
            [ioTool writeFile:[fileName stringByAppendingString:@"_system"] content:content];
            break;
        
        case 5://create index _name _item
        {
            
            if (![self canOperate]) {
                return;
            }
            
            fileName = [input componentsSeparatedByString:@" "][2];
            content_system = [ioTool readFile:[fileName stringByAppendingString:@"_system"]];
            
            par = [input componentsSeparatedByString:@" "][3];
            singlePar = [content_system componentsSeparatedByString:@","];
            int index = 0;
            for (int i = 0; i<singlePar.count; i++) {
                NSString *tem = [singlePar[i] componentsSeparatedByString:@"[] "][1];
                if ([tem isEqualToString:par]) {
                    index = i;
                }
            }
            
            content = [ioTool readFile:fileName];
            NSArray *item = [content componentsSeparatedByString:@"\n"];
            
            int dataWrite[10][2];
            for (int i = 0; i<item.count; i++) {
                dataWrite[i][0] = [[item[i] componentsSeparatedByString:@" "][index] intValue];
                dataWrite[i][1] = i;
            }
            
            /**
             *  排序
             */
            for (int a = 0; a<item.count-1; a++) {
                
            for(int x = 0;x<item.count-1;x++)
            {
                int temp;
                if (dataWrite[x][0]>dataWrite[x+1][0]) {
                    for (int i = 0; i<2; i++) {
                        temp = dataWrite[x][i];
                        dataWrite[x][i] = dataWrite[x+1][i];
                        dataWrite[x+1][i] = temp;
                    }
                }
            }
                
            }
            
            NSString *str = [[NSString alloc] init] ;
            for (int i = 0; i<item.count ; i++) {
                str = [str stringByAppendingString:[NSString stringWithFormat:@"%d %d\n",dataWrite[i][0],dataWrite[i][1]]];
            }
            
            fileName = [fileName stringByAppendingString:@"_sno"];
            
            [ioTool writeFile:fileName content:str];

            break;
        }
            
        case 6:
        {
            if (![self canOperate]) {
                return;
            }
            
            NSArray *inputCount = [input componentsSeparatedByString:@" "];
            
            if (inputCount.count == 4) {
                if ([[input componentsSeparatedByString:@" "][1] isEqualToString:@"*"]) {
                    fileName = [input componentsSeparatedByString:@" "][3];
                    content = [ioTool readFile:fileName];
                    
                    content_system = [ioTool readFile:[fileName stringByAppendingString:@"_system"]];
                    NSLog(@"%@",content);
                }
                else { //实现单关系的投影操作（select 属性名列表 from 关系名）
                    
                    
                    fileName = [input componentsSeparatedByString:@" "][3];
                    content = [ioTool readFile:fileName];
                    
                    content_system = [ioTool readFile:[fileName stringByAppendingString:@"_system"]];
                    NSLog(@"%@",content);
                    arr = [NSMutableArray arrayWithArray:[content componentsSeparatedByString:@"\n"]];
                    
                    par = [input componentsSeparatedByString:@" "][1];
                    singlePar = [content_system componentsSeparatedByString:@","];
                    int index = 0;
                    for (int i = 0; i<singlePar.count; i++) {
                        NSString *tem = [singlePar[i] componentsSeparatedByString:@"[] "][1];
                        if ([tem isEqualToString:par]) {
                            index = i;
                        }
                    }
                    
                    NSString *temp = [[NSString alloc] init];
                    for (int i = 0; i<arr.count; i++) {
                        NSArray *tem = [arr[i] componentsSeparatedByString:@" "];
                        if (tem.count == 1) {
                            continue;
                        }
                        NSString *item = [NSString stringWithFormat:@"%@\n",tem[index]];
                        temp = [temp stringByAppendingString:item];
                    }
                    
                    NSLog(@"%@",temp);
                    
                }
            }
            
            else if (inputCount.count == 7){//select 属性名列表 from 关系名 where 选择条件
                fileName = [input componentsSeparatedByString:@" "][3];
                content = [ioTool readFile:fileName];
                
                content_system = [ioTool readFile:[fileName stringByAppendingString:@"_sno"]];
                NSLog(@"%@",content);
                
                
                NSString *intValue = [input componentsSeparatedByString:@" "][6];
                
                NSArray *indexArr = [content_system componentsSeparatedByString:@"\n"];
                for (int i = 0; i<indexArr.count; i++) {
                    if ([[indexArr[i] componentsSeparatedByString:@" " ][0] isEqualToString:intValue]) {
                        index = i;
                    }
                }
                
                NSString *opr = [input componentsSeparatedByString:@" "][5];
                NSArray *contentArr = [content componentsSeparatedByString:@"\n"];
                if ([opr isEqualToString:@"="]) {
                    NSLog(@"%@",contentArr[index]);
                }
                else if ([opr isEqualToString:@">"]){
                    NSArray *serch =  [content_system componentsSeparatedByString:@"\n"];
                    for (int i =index; i<contentArr.count; i++) {
                        int s = [[serch[i] componentsSeparatedByString:@" "][1] intValue];
                        NSLog(@"%@",contentArr[s]);
                    }
                }
                else if ([opr isEqualToString:@"<"]){
                    NSArray *serch =  [content_system componentsSeparatedByString:@"\n"];
                    for (int i =0; i<index; i++) {
                        int s = [[serch[i] componentsSeparatedByString:@" "][1] intValue];
                        NSLog(@"%@",contentArr[s]);
                    }
                }
            }
            
            break;
        }
            
        default:
            break;
    }
    
}

- (BOOL)isNum:(NSString *)str{
    NSScanner *scan = [NSScanner scannerWithString:str];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

- (BOOL)canOperate{
    if ([self.nowUser isEqualToString:@"1"]) {
        NSLog(@"您没有此权限！");
        return NO;
    }
    return YES;
}

- (NSInteger) convert:(NSString *) command{
    command = [command uppercaseString];
    NSArray *commandArr = [command componentsSeparatedByString:@" "];
    if ([command isEqualToString:@"CREATE TABLE"]) {
        return 0;
    }
    else if([command isEqualToString:@"INSERT INTO"]){
        return 1;
    }
    else if([command isEqualToString:@"DELETE FROM"]){
        return 2;
    }
    else if([command isEqualToString:@"UPDATE  "]){
        return 3;
    }
    else if([command isEqualToString:@"ALTER NEW"]){
        
        return 4;
    }
    else if([command isEqualToString:@"CREATE INDEX"]){
        return 5;
    }
    else if([commandArr[0] isEqualToString:@"SELECT"]){
        return 6;
    }
    else if([command isEqualToString:@"H"]){
        return 7;
    }
    else if([command isEqualToString:@"M"]){
        return 8;
    }
    else if ([command isEqualToString:@"A"]){
        return 9;
    }
    else if ([command isEqualToString:@"K"]){
        return 10;
    }
    else if ([command isEqualToString:@"FIFO"]){
        return 11;
    }
    else {
        return 110;
    }
}



@end
