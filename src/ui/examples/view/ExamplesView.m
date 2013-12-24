//
//  ExamplesView.m
//  ExamplesProject
//
//  Created by Chaban Nikolay on 12/24/13.
//  Copyright 2013 On Sight. All rights reserved.
//

#import "ExamplesView.h"
#import "ExamplesCell.h"

static NSString* cellID = @"ExamplesCellID";

@interface ExamplesView () <UITableViewDelegate, UITableViewDataSource>

// properties

/** Examples table datasource content
 */
@property (nonatomic, strong) NSArray* listContent;

/** Examples list
 */
@property (nonatomic, strong) UITableView* examplesTable;

// methods

/** Create UI
 */
- (void) createUI;

/** Setup defaults
 */
- (void) setupDefaults;

/** init and setup examples table list
 */
- (void) setupExamplesTable;

@end

@implementation ExamplesView

// public properties


// private properties
@synthesize listContent;
@synthesize examplesTable;


#pragma mark - Initialization -

- (id) initWithFrame: (CGRect)   frame
     withListContent: (NSArray*) _listContent
{
    if (self = [super initWithFrame: frame])
    {
        self.listContent = _listContent;
        
        [self setupDefaults];
    }
    
    return self;
}

#pragma mark - Defaults -

- (void) setupDefaults
{
    // Create UI
    //
    [self createUI];
}


#pragma mark - UI -

- (void) createUI
{
    // Setup examples list
    //
    [self setupExamplesTable];
}

- (void) setupExamplesTable
{
    self.examplesTable = [[UITableView alloc] initWithFrame: self.bounds
                                                      style: UITableViewStylePlain];
    
    self.examplesTable.dataSource = self;
    self.examplesTable.delegate   = self;
    
    [self addSubview: self.examplesTable];
}


#pragma mark - Table view datasource methods -

- (NSInteger) numberOfSectionsInTableView: (UITableView*) tableView
{
    return 1;
}

- (NSInteger) tableView: (UITableView*) tableView
  numberOfRowsInSection: (NSInteger)    section
{
    return self.listContent.count;
}

- (CGFloat)    tableView: (UITableView*) tableView
 heightForRowAtIndexPath: (NSIndexPath*) indexPath
{
    return 50;
}

- (UITableViewCell*) tableView: (UITableView*) tableView
         cellForRowAtIndexPath: (NSIndexPath*) indexPath
{
    ExamplesCell* cell = (ExamplesCell*)[tableView dequeueReusableCellWithIdentifier: cellID];
    
    if (!cell)
    {
        cell = [[ExamplesCell alloc] initWithStyle: UITableViewCellStyleSubtitle
                                   reuseIdentifier: cellID];
        
        cell.textLabel.textColor       = [UIColor colorWithRed: 0.20f green: 0.20f blue: 0.20f alpha: 1.00f];
        cell.detailTextLabel.textColor = [UIColor colorWithRed: 0.29f green: 0.29f blue: 0.29f alpha: 1.00f];
    }
    
    cell.textLabel.text       = self.listContent[indexPath.row][@"title"];
    cell.detailTextLabel.text = self.listContent[indexPath.row][@"Description"];
    
    return cell;
}


#pragma mark - Table view delegate methods -

- (void)       tableView: (UITableView*) tableView
 didSelectRowAtIndexPath: (NSIndexPath*) indexPath
{
    
}


@end
