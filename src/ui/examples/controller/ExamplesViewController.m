//
//  ExamplesViewController.m
//  ExamplesProject
//
//  Created by Chaban Nikolay on 12/24/13.
//  Copyright 2013 On Sight. All rights reserved.
//

#import "ExamplesViewController.h"
#import "ExamplesView.h"
#import "ExamplesModel.h"

@interface ExamplesViewController ()

// properties

/** Examples view
 */
@property (nonatomic, strong) ExamplesView* examplesView;

/** Model list file path
 */
@property (nonatomic, strong) NSString* modelListPath;

/** Examples list dictionary
 */
@property (nonatomic, strong) NSArray* listContent;

/** Examples list content model
 */
@property (nonatomic, strong) ExamplesModel* contentModel;

// methods

/** Create UI
 */
- (void) createUI;

/** Setup defaults
 */
- (void) setupDefaults;

/** Setup examples list model content
 */
- (void) setupContentModel;

@end

@implementation ExamplesViewController

// public properties


// private properties
@synthesize examplesView;
@synthesize modelListPath;
@synthesize listContent;


#pragma mark - Initialization -

- (id) initWithPlistPath: (NSString*) path
{
    if (self = [super init])
    {
        self.modelListPath = path;
        
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
    // Setup model
    //
    [self setupContentModel];
    
    // Setup title
    //
    self.title = NSLocalizedString(@"Examples", nil);
}


#pragma mark - Model -

- (void) setupContentModel
{
    NSDictionary* contentDictionary = [NSDictionary dictionaryWithContentsOfFile: self.modelListPath];
    
    self.contentModel = [[ExamplesModel alloc] initWithExamplesDictionary: contentDictionary];
    
    self.listContent = self.contentModel.listContent();
}


#pragma mark - UI -

- (void) createUI
{
    self.examplesView = [[ExamplesView alloc] initWithFrame: self.view.bounds
                                            withListContent: self.listContent];
    
    [self.view addSubview: self.examplesView];
}


@end
