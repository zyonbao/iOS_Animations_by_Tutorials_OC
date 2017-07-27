//
//  PopAnimator.m
//  BeginnerCook
//
//  Created by zyon on 27/07/2017.
//  Copyright © 2017 Zyon. All rights reserved.
//

#import "PopAnimator.h"

@interface PopAnimator()

@end

@implementation PopAnimator

- (instancetype)init {
    if (self = [super init]) {
        _duration = 1.0f;
        _presenting = YES;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return _duration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *containerView = transitionContext.containerView;
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *herbView = _presenting ? toView : [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    CGRect initialFrame = _presenting ? _originFrame : herbView.frame;
    CGRect finalFrame = _presenting ? herbView.frame : _originFrame;
    
    CGFloat xScaleFactor = _presenting ?
            (CGRectGetWidth(initialFrame)/CGRectGetWidth(finalFrame)) :
            (CGRectGetWidth(finalFrame)/CGRectGetWidth(initialFrame));
    CGFloat yScaleFactor = _presenting ?
        (CGRectGetHeight(initialFrame)/CGRectGetHeight(finalFrame)) :
        (CGRectGetHeight(finalFrame)/CGRectGetHeight(initialFrame));
    
    CGAffineTransform scaleTransform = CGAffineTransformScale(CGAffineTransformIdentity, xScaleFactor, yScaleFactor);
    
    if (_presenting) {
        herbView.transform = scaleTransform;
        herbView.center = CGPointMake(CGRectGetMidX(initialFrame), CGRectGetMidY(initialFrame));
        herbView.clipsToBounds = YES;
    }
    [containerView addSubview:toView];
    [containerView bringSubviewToFront:herbView];
    
    [UIView  animateWithDuration:_duration delay:0.0f usingSpringWithDamping:0.4 initialSpringVelocity:0.0 options:0 animations:^{
        herbView.transform = self.presenting ? CGAffineTransformIdentity : scaleTransform;
        herbView.center = CGPointMake(CGRectGetMidX(finalFrame), CGRectGetMidY(finalFrame));
    } completion:^(BOOL finished) {
        if (!_presenting) {
            self.dismissCompletion();
        }
        [transitionContext completeTransition:YES];
    }];
    
}

@end
