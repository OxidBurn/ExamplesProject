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

/** Title label
 */
@property (nonatomic, strong) UILabel* titleLabel;

/** Description label
 */
@property (nonatomic, strong) UILabel* descriptionLabel;

// methods

- (void) setupTitleLabel;

- (void) setupDescriptionLabel;

@end

@implementation ExamplesCell

// public properties


// private properties


#pragma mark - Initialization -

/**
 *  Initialization with frame and reusable identifier
 *
 *  @param style           cell style
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
        // Create UI
        //
        [self createUI];
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

- (void) layoutSubviews
{
    [super layoutSubviews];
    
    if (self.height == 80)
    {
        [self.titleLabel setYOrigin: 5];
        
        self.descriptionLabel.hidden = NO;
    }
    else
    {
        [self.titleLabel setYOrigin: (self.height - 25) / 2];
        
        self.descriptionLabel.hidden = YES;
    }
}

- (void) setNeedsLayout
{
    [super setNeedsLayout];
}


#pragma mark - UI -

- (void) createUI
{
    // Title label
    //
    [self setupTitleLabel];
    
    // Desctiption label
    //
    [self setupDescriptionLabel];
}

/**
 *  Init and setup title label
 */
- (void) setupTitleLabel
{
    self.titleLabel = [[UILabel alloc] initWithFrame: CGRectMake(15, (self.height - 25) / 2, self.width - 15, 22)];

    self.titleLabel.textColor        = [UIColor colorWithRed: 0.20f green: 0.20f blue: 0.20f alpha: 1.00f];
    self.titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.titleLabel.font             = [Utils regularFont: 20];
    
    [self.contentView addSubview: self.titleLabel];
}

/**
 *  Init and setup desctiption label
 */
- (void) setupDescriptionLabel
{
    self.descriptionLabel = [[UILabel alloc] initWithFrame: CGRectMake(15, self.titleLabel.maxY, self.width - 15, 40)];
    
    self.descriptionLabel.textColor        = [UIColor colorWithRed: 0.29f green: 0.29f blue: 0.29f alpha: 1.00f];
    self.descriptionLabel.hidden           = YES;
    self.descriptionLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.descriptionLabel.numberOfLines    = NSIntegerMax;
    self.descriptionLabel.lineBreakMode    = NSLineBreakByWordWrapping;
    self.descriptionLabel.font             = [Utils lightFont: 10];
    
    [self.contentView addSubview: self.descriptionLabel];
}


#pragma mark - Fill values -

- (void) fillContent: (NSString*) titleText
        withDescText: (NSString*) descText
{
    self.titleLabel.text       = titleText;
    self.descriptionLabel.text = descText;
}

@end
