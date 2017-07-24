//
//  SuperBlock.h
//  Block
//
//  Created by whf on 17/7/16.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SubObject.h"

typedef void (^blk_t0)(id obj);

@interface SuperBlock : NSObject

@property (nonatomic, strong) SubObject *subObject;

- (void)mainFunc;

@end
