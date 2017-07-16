//
//  SuperBlock.h
//  Block
//
//  Created by whf on 17/7/16.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^blk_t)(id obj);

@interface SuperBlock : NSObject

- (void)mainFunc;

@end
