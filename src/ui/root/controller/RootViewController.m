//
//  RootViewController.m
//  ExamplesProject
//
//  Created by Chaban Nikolay on 12/23/13.
//  Copyright 2013 On Sight. All rights reserved.
//

#import "RootViewController.h"
#import "RootView.h"

@interface RootViewController ()

// properties

/** Main view
 */
@property (nonatomic, strong) RootView* mainView;

// methods

/** Create UI
 */
- (void) createUI;

/** Setup defaults
 */
- (void) setupDefaults;

/** initialize and setup main view
 */
- (void) setupMainView;

@end

@implementation RootViewController

// public properties


// private properties
@synthesize mainView;


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
    
    [self createUI];
}

- (void) loadView
{
    [super loadView];
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
    // Setup main view
    //
    [self setupMainView];
}

- (void) setupMainView
{
    self.mainView = [[RootView alloc] initWithFrame: self.view.bounds];
    
    [self.view addSubview: self.mainView];
}


@end
