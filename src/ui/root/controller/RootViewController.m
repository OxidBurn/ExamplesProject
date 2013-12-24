//
//  RootViewController.m
//  ExamplesProject
//
//  Created by Chaban Nikolay on 12/23/13.
//  Copyright 2013 On Sight. All rights reserved.
//

#import "RootViewController.h"
#import "RootView.h"
#import "ExamplesViewController.h"
#import "BaseNavigationController.h"

@interface RootViewController ()

// properties

/** Main view
 */
@property (nonatomic, strong) RootView* mainView;

/** Examples view controller
 */
@property (nonatomic, strong) ExamplesViewController* examplesController;

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

/** Init and setup examples view controller
 */
- (void) setupExamplesViewController;

@end

@implementation RootViewController

// public properties


// private properties
@synthesize mainView;
@synthesize examplesController;


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
    
    // Setup examples controller
    //
    [self setupExamplesViewController];
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

- (void) setupExamplesViewController
{
    self.examplesController = [[ExamplesViewController alloc] initWithPlistPath: [Constants pathToExamplesList]];
    
    BaseNavigationController* exampleNavController = [[BaseNavigationController alloc] initWithRootViewController: self.examplesController];
    
    [self.navigationController presentViewController: exampleNavController
                                            animated: NO
                                          completion: nil];
}


@end
