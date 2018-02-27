//
//  PathView.m
//  弧形的摆动
//
//  Created by 伍小华 on 2018/2/27.
//  Copyright © 2018年 伍小华. All rights reserved.
//

#import "PathView.h"
@interface PathView ()
@property (nonatomic, strong) UIBezierPath *bezierPath;
@end
@implementation PathView

- (void)drawBezierPath:(UIBezierPath *)bezierPath
{
    self.bezierPath = bezierPath;
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect
{
    if (self.bezierPath) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextAddPath(context, self.bezierPath.CGPath);
        CGContextStrokePath(context);
    }
}

@end
