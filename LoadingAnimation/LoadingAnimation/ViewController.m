//
//  ViewController.m
//  LoadingAnimation
//
//  Created by 伍小华 on 2018/3/2.
//  Copyright © 2018年 伍小华. All rights reserved.
//

#import "ViewController.h"

#import "LoadingView.h"
@interface ViewController ()
@property (nonatomic, strong) LoadingView *loadingView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.loadingView = [[LoadingView alloc] initWithFrame:CGRectMake(0, 0, 200, 70)];
    self.loadingView.center = self.view.center;
    [self.view addSubview:self.loadingView];
    
    self.loadingView.infolabel.text = @"正在加载模型...";
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.loadingView.isAnimation) {
        [self.loadingView stopAnimation];
    } else {
        [self.loadingView startAnimation];
    }
}




@end
