//
//  PresentDetailTransition.m
//  PuppyBombs
//
//  Created by Calvin Nisbet on 2015-03-10.
//  Copyright (c) 2015 Calvin Nisbet. All rights reserved.
//

#import "PresentDetailTransition.h"

@implementation PresentDetailTransition


-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *detail = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    detail.view.alpha = 0.0;
    
    
    CGRect frame = containerView.bounds;
    frame.origin.y += 20.0;
    frame.size.height -= 20.0;
    
    detail.view.frame = frame;
    
    
    [containerView addSubview:detail.view];
    
    [UIView animateWithDuration:0.3 animations:^{
        detail.view.alpha = 1.0;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}



-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3;
}

@end
