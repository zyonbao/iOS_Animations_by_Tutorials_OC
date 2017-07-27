//
//  PopAnimator.h
//  BeginnerCook
//
//  Created by zyon on 27/07/2017.
//  Copyright © 2017 Zyon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PopAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) BOOL presenting;
@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, assign) CGRect originFrame;
@property (nonatomic, copy)  void (^dismissCompletion)(void) ;

@end
