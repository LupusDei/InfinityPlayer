//
//  IPNavigationVC.m
//  InfinityPlayer
//
//  Created by Justin Martin on 9/21/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPNavigationVC.h"

@interface IPNavigationVC ()

@end

@implementation IPNavigationVC

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
    NSLog(@"NAV -- view did load");
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
