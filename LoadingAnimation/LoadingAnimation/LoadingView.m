//
//  LoadingView.m
//  LoadingAnimation
//
//  Created by 伍小华 on 2018/3/2.
//  Copyright © 2018年 伍小华. All rights reserved.
//

#import "LoadingView.h"

static NSString *const kAnimationName = @"kAnimationName";
@interface LoadingView()
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) UIView *flashView;

@property (nonatomic, assign) CGFloat flashWidth;
@end
@implementation LoadingView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.maskView];
        [self addSubview:self.infolabel];
        
        self.flashWidth = 100.0f;
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.maskView.frame = CGRectMake(0, 0, self.frame.size.width, 10);
    self.flashView.frame = CGRectMake(-self.flashWidth, 0, self.flashWidth, self.maskView.frame.size.height);
    self.infolabel.frame = CGRectMake(0, self.frame.size.height-50, self.frame.size.width, 50);
}
- (void)startAnimation
{
    if (!self.isAnimation) {
        [self.flashView.layer addAnimation:[self animation] forKey:kAnimationName];
        self.isAnimation = YES;
    }
}
- (void)stopAnimation
{
    if (self.isAnimation) {
        [self.flashView.layer removeAnimationForKey:kAnimationName];
        self.isAnimation = NO;
    }
}
- (CABasicAnimation *)animation
{
    CGPoint fromPoint = self.flashView.center;
    CGPoint toPoint = fromPoint;
    toPoint.x = toPoint.x + self.maskView.frame.size.width+self.flashView.frame.size.width;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.duration = 1.0;
    
    animation.fromValue = [NSValue valueWithCGPoint:fromPoint];
    animation.toValue = [NSValue valueWithCGPoint:toPoint];
    animation.repeatCount = MAXFLOAT;
    return animation;
}

#pragma mark - Setter / Getter
- (UIView *)maskView
{
    if (!_maskView) {
        _maskView = [[UIView alloc] init];
        _maskView.layer.cornerRadius = 5.0f;
        _maskView.layer.borderWidth = 2.0f;
        _maskView.layer.borderColor = [UIColor whiteColor].CGColor;
        _maskView.clipsToBounds = YES;
        [_maskView addSubview:self.flashView];
        [_maskView sendSubviewToBack:self.flashView];
    }
    return _maskView;
}
- (UIView *)flashView
{
    if (!_flashView) {
        _flashView = [[UIView alloc] init];
        _flashView.backgroundColor = [UIColor greenColor];
        _flashView.layer.cornerRadius = 5.0f;
        _flashView.backgroundColor = [UIColor colorWithRed:24/255.0 green:167/255.0 blue:196/255.0 alpha:1.0];
    }
    return _flashView;
}

- (UILabel *)infolabel
{
    if (!_infolabel) {
        _infolabel = [[UILabel alloc] init];
        _infolabel.font = [UIFont systemFontOfSize:20.0];
        _infolabel.textColor = [UIColor whiteColor];
        _infolabel.textAlignment = NSTextAlignmentCenter;
    }
    return _infolabel;
}
@end


