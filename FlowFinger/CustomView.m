//
//  CustomView.m
//  FlowFinger
//
//  Created by apple on 16/1/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

int curX;
int curY;

- (void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint lastTouch = [touch locationInView:self];
    curX = lastTouch.x;
    curY = lastTouch.y;
    [self setNeedsDisplay];
}
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint curTouch = [touch locationInView:self];
    curX = curTouch.x;
    curY = curTouch.y;
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, [[UIColor redColor] CGColor]);
    CGContextFillEllipseInRect(ctx, CGRectMake(curX - 10, curY - 10, 20, 20));
}
@end
