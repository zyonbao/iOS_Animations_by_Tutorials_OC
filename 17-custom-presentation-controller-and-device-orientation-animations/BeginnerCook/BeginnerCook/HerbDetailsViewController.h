//
//  HerbDetailsViewController.h
//  BeginnerCook
//
//  Created by zyon on 27/07/2017.
//  Copyright © 2017 Zyon. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HerbModel;

@interface HerbDetailsViewController : UIViewController //<UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) HerbModel *herb;

@end
