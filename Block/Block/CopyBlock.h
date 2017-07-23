//
//  CopyBlock.h
//  Block
//
//  Created by whf on 17/7/16.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "SuperBlock.h"

typedef void (^blk_t3)(id obj);
@interface CopyBlock : SuperBlock

@property (nonatomic , strong) blk_t3 blk;

@end
