//
//  ViewController.m
//  弧形的摆动
//
//  Created by 伍小华 on 2018/2/27.
//  Copyright © 2018年 伍小华. All rights reserved.
//

#import "ViewController.h"
#import "PathView.h"
@interface ViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) PathView *pathView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.pathView];
    [self.view addSubview:self.imageView];
    self.imageView.center = self.view.center;
    self.pathView.frame = self.view.bounds;
    
    
    CGFloat distance = 100;
    CGPoint middlePoint = self.view.center;
    CGPoint leftPoint = CGPointMake(middlePoint.x - distance, middlePoint.y);
    CGPoint rightPoint = CGPointMake(middlePoint.x + distance, middlePoint.y);
    middlePoint.y -= distance/2.0;
    
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:leftPoint];
    [path addQuadCurveToPoint:rightPoint controlPoint:middlePoint];
    keyAnimation.path = path.CGPath;
    keyAnimation.duration = 2.0;
    
    //设置了循环无数次的话，这两个就没有用了
//    keyAnimation.removedOnCompletion = NO;
//    keyAnimation.fillMode = kCAFillModeForwards;
    
    keyAnimation.autoreverses = YES;//回到起点
    keyAnimation.repeatCount = MAXFLOAT;
    keyAnimation.rotationMode = kCAAnimationRotateAuto;
    keyAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.imageView.layer addAnimation:keyAnimation forKey:@"keyAnimation"];
    [self.pathView drawBezierPath:path];
}


- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor brownColor];
        _imageView.frame = CGRectMake(0, 0, 50, 50);
        _imageView.image = [UIImage imageNamed:@"gesture.png"];
    }
    return _imageView;
}
- (PathView *)pathView
{
    if (!_pathView) {
        _pathView = [[PathView alloc] init];
        _pathView.backgroundColor = [UIColor whiteColor];
    }
    return _pathView;
}
@end
