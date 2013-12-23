//
//  RootView.m
//  ExamplesProject
//
//  Created by Chaban Nikolay on 12/23/13.
//  Copyright 2013 On Sight. All rights reserved.
//

#import "RootView.h"

@interface RootView ()

// properties



// methods

/** Create UI
 */
- (void) createUI;

/** Setup defaults
 */
- (void) setupDefaults;

@end

@implementation RootView

// public properties


// private properties



#pragma mark - Initialization -

- (id) initWithFrame: (CGRect) frame
{
    if (self = [super initWithFrame: frame])
    {
        [self setupDefaults];
    }
    
    return self;
}

#pragma mark - Defaults -

- (void) setupDefaults
{
    self.backgroundColor = [UIColor darkGrayColor];
}


#pragma mark - UI -

- (void) createUI
{
    
}


@end
