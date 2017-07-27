//
//  ViewController.m
//  BeginnerCook
//
//  Created by zyon on 27/07/2017.
//  Copyright © 2017 Zyon. All rights reserved.
//

#import "ViewController.h"
#import "PopAnimator.h"
#import "HerbModel.h"
#import "HerbDetailsViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *bgImage;
@property (weak, nonatomic) IBOutlet UIScrollView *listView;

@property (nonatomic, strong) NSArray<HerbModel*> *herbs;
@property (nonatomic, strong) UIImageView *selectedImage;
@property (nonatomic, strong) PopAnimator *transition;

@end

@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _transition = [PopAnimator new];
        _herbs = [HerbModel all];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weak_self = self;
    _transition.dismissCompletion = ^(){
        if (weak_self.selectedImage) {
            weak_self.selectedImage.hidden = NO;
        }
    };
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (_listView.subviews.count<_herbs.count) {
        if ([_listView viewWithTag:0]) {
            [_listView viewWithTag:0].tag = 1000;
        }
        [self setupList];
    }
}

- (void)setupList {
    for (NSInteger i = 0; i<_herbs.count; i++) {
        HerbModel *herb = _herbs[i];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:herb.image]];
        imageView.tag = i+1;
        imageView.userInteractionEnabled = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.layer.cornerRadius = 5.0f;
        imageView.layer.masksToBounds = YES;
        [_listView addSubview:imageView];
        
        [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapImageView:)]];
    }
    
    _listView.backgroundColor = [UIColor clearColor];
    [self positionListItems];
}

- (void)positionListItems {
    
    CGFloat listHeight = CGRectGetHeight(_listView.frame);
    CGFloat itemHeight = listHeight * 1.33;
    CGFloat aspectRatio = CGRectGetHeight([[UIScreen mainScreen] bounds])/CGRectGetWidth([[UIScreen mainScreen] bounds]);
    CGFloat itemWidth = itemHeight / aspectRatio;
    CGFloat horizontalPadding = 10.0f;
    
    for (NSInteger i = 0; i < _herbs.count; i++) {
        UIImageView *imageView = [_listView viewWithTag:i+1];
        imageView.frame = CGRectMake(i*itemWidth+(i+1)*horizontalPadding, 0.0f, itemWidth, itemHeight);
    }
    _listView.contentSize = CGSizeMake(_herbs.count * (itemWidth+horizontalPadding)+horizontalPadding, 0);
}

- (void)didTapImageView:(UITapGestureRecognizer *)sender {
    _selectedImage = (UIImageView*)sender.view;
    NSInteger index = sender.view.tag-1;
    HerbModel *selectedHerb = _herbs[index];
    
    HerbDetailsViewController *herbDetailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"HerbDetailsViewController"];
    herbDetailVC.herb = selectedHerb;
    herbDetailVC.transitioningDelegate = self;
    [self presentViewController:herbDetailVC animated:YES completion:nil];
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.bgImage.alpha = size.width>size.height ? 0.25 : 0.55;
        [self positionListItems];
    } completion:nil];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    _transition.originFrame = [_selectedImage.superview convertRect:_selectedImage.frame toView:nil];
    _transition.presenting = YES;
    _selectedImage.hidden = YES;
    return _transition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    _transition.presenting = NO;
    return _transition;
}

@end
