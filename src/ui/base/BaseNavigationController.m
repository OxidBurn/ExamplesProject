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
        UIImage* bgImage = [[UIImage imageNamed: @"nabBarBg"] stretchableImageWithLeftCapWidth: 0
                                                                                  topCapHeight: 0];
        
        // Set the background image all UINavigationBars
        [[UINavigationBar appearance] setBackgroundImage: bgImage
                                           forBarMetrics: UIBarMetricsDefault];
        [[UINavigationBar appearance] setBackgroundImage: bgImage
                                           forBarMetrics: UIBarMetricsLandscapePhone];
        
        NSMutableDictionary* attributes = [NSMutableDictionary dictionary];
        
        
        [attributes setValue: [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f] forKey: UITextAttributeTextColor];
        [attributes setValue: [UIColor clearColor] forKey: UITextAttributeTextShadowColor];
        [attributes setValue: [NSValue valueWithUIOffset: UIOffsetMake(0.0, 0.0)] forKey: UITextAttributeTextShadowOffset];
        [[UIBarButtonItem appearance] setTitleTextAttributes: attributes forState: UIControlStateNormal];
        
        [[UINavigationBar appearance] setTitleTextAttributes: attributes];
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
