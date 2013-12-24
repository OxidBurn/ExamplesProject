//
//  ExamplesCell.m
//  ExamplesProject
//
//  Created by Chaban Nikolay on 12/24/13.
//  Copyright (c) 2013 On Sight. All rights reserved.
//

#import "ExamplesCell.h"

@interface ExamplesCell()

// properties


// methods


@end

@implementation ExamplesCell

// public properties


// private properties


#pragma mark - Initialization -

/**
 *  Initialization with frame and reusable identifier
 *
 *  @param style           cell frame
 *  @param reuseIdentifier reusable identifier
 *
 *  @return cell object
 */

- (id) initWithStyle: (UITableViewCellStyle) style
     reuseIdentifier: (NSString*)            reuseIdentifier
{
    if (self = [super initWithStyle: style
                    reuseIdentifier: reuseIdentifier])
    {
        
    }
    
    return self;
}


#pragma mark - Delegate methods -

/**
 *  Set selected delegate methods
 *
 *  @param selected selected state
 *  @param animated animated selecting
 */

- (void) setSelected: (BOOL) selected
            animated: (BOOL) animated
{
    [super setSelected: selected
              animated: animated];

    // Configure the view for the selected state
    //
}

@end
