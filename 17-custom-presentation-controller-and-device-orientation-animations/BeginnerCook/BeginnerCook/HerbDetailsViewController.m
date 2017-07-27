//
//  HerbDetailsViewController.m
//  BeginnerCook
//
//  Created by zyon on 27/07/2017.
//  Copyright © 2017 Zyon. All rights reserved.
//

#import "HerbDetailsViewController.h"
#import "HerbModel.h"

@interface HerbDetailsViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *bgImage;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UITextView *descView;

@end

@implementation HerbDetailsViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    _bgImage.image = [UIImage imageNamed:_herb.image];
    _titleView.text = _herb.name;
    _descView.text = _herb.desc;
    
    [self.view  addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionClose:)]];
    
}

- (void)actionClose:(id)sender {
    if (self.presentingViewController) {
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


@end
