//
//  BaseNavigationController.m
//  DoctorApp
//
//  Created by Chaban Nickolay on 9/16/13.
//  Copyright (c) 2013 Chaban Nickolay. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (id) initWithRootViewController: (UIViewController*) rootViewController
{
    if (self = [super initWithRootViewController: rootViewController])
    {
        
    }
    
    return self;
}

- (BOOL) shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation) toInterfaceOrientation
{
    return [self.topViewController shouldAutorotateToInterfaceOrientation: toInterfaceOrientation];
}

- (NSUInteger) supportedInterfaceOrientations
{
    return [self.topViewController supportedInterfaceOrientations];
}

- (BOOL) shouldAutorotate
{
    return YES;
}

@end
