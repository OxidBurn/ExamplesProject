//
//  BaseViewController.m
//  DoctorApp
//
//  Created by Chaban Nickolay on 9/16/13.
//  Copyright (c) 2013 Chaban Nickolay. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (id) init
{
    self = [super init];
    
    if (self)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
	
}

- (void) loadView
{
    [super loadView];
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL) shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation) toInterfaceOrientation
{
    return YES;
}

- (BOOL) shouldAutorotate
{
    return YES;
}

- (NSUInteger) supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

@end
