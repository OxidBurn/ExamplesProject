//
//  RootViewController.m
//  ExamplesProject
//
//  Created by Chaban Nikolay on 12/23/13.
//  Copyright 2013 On Sight. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

// properties



// methods

/** Create UI
 */
- (void) createUI;

/** Setup defaults
 */
- (void) setupDefaults;

@end

@implementation RootViewController

// public properties


// private properties



#pragma mark - Initialization -

- (id) init
{
    if (self = [super init])
    {
        [self setupDefaults];
    }
    
    return self;
}


#pragma mark - View -

- (void) viewDidLoad
{
    [super viewDidLoad];
}

- (void) loadView
{
    [super loadView];
    
    [self createUI];
}

- (void) viewDidAppear: (BOOL) animated
{
    [super viewDidAppear: animated];
}


#pragma mark - Memory managment -

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    NSLog(@"Memory warning %@", NSStringFromSelector(_cmd));
}


#pragma mark - Defaults -

- (void) setupDefaults
{
    
}


#pragma mark - UI -

- (void) createUI
{
    
}


@end
