//
//  IPAbstractVC.m
//  InfinityPlayer
//
//  Created by Justin Martin on 9/21/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPAbstractVC.h"

@interface IPAbstractVC ()

@end

@implementation IPAbstractVC {
    UIButton *_backButton;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.navigationController) {
        [self.navigationController setNavigationBarHidden:YES animated:NO];
        
        if ([[self.navigationController viewControllers] objectAtIndex:0] != self) {
            [self addBackButton];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) addBackButton {
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backButton setImage:[UIImage imageNamed:@"back_button"] forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    _backButton.frame = CGRectMake(ipTinySpacer, ipStatusBarHeight + ipMiniSpacer, ipBackButtonWidth, ipBackButtonWidth);
    [self.view addSubview:_backButton];
}

-(void) goBack {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
