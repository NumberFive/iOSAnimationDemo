//
//  LoadingView.h
//  LoadingAnimation
//
//  Created by 伍小华 on 2018/3/2.
//  Copyright © 2018年 伍小华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingView : UIView
@property (nonatomic, strong) UILabel *infolabel;
@property (nonatomic, assign) BOOL isAnimation;
- (void)startAnimation;
- (void)stopAnimation;
@end
