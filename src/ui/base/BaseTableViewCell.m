//
//  BaseTableViewCell.m
//  DoctorApp
//
//  Created by Chaban Nickolay on 9/16/13.
//  Copyright (c) 2013 Chaban Nickolay. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface BaseTableViewCell()

// property



// methods



@end


@implementation BaseTableViewCell

// public properties


// private properties


#pragma mark - Initialization -

- (id) initWithStyle: (UITableViewCellStyle) style
     reuseIdentifier: (NSString*)            reuseIdentifier
{
	if ((self = [super initWithStyle: style
                     reuseIdentifier: reuseIdentifier]))
	{
        
	}
	
	return self;
}


#pragma mark - Data source methods -

- (void) setSelected: (BOOL) selected
            animated: (BOOL) animated
{
    if (!selected)
        self.backgroundView.backgroundColor = [UIColor colorWithRed: 0.12f green: 0.12f blue: 0.12f alpha: 1.00f];
    else
        self.backgroundView.backgroundColor = [UIColor colorWithRed: 0.14f green: 0.14f blue: 0.14f alpha: 1.00f];
    
    [super setSelected: selected
              animated: animated];
}

- (void) setupBackground
{
    self.backgroundView = [[UIView alloc] initWithFrame: self.bounds];
    
    self.backgroundView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
}


@end
