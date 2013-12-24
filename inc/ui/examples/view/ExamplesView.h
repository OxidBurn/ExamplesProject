//
//  ExamplesView.h
//  ExamplesProject
//
//  Created by Chaban Nikolay on 12/24/13.
//  Copyright 2013 On Sight. All rights reserved.
//

#import "BaseView.h"

@interface ExamplesView : BaseView

// properties


// methods

/**
 *  Initialization with frame and examples table list content
 *
 *  @param frame        frame
 *  @param _listContent list content
 *
 *  @return ExamplesView object
 */
- (id) initWithFrame: (CGRect)   frame
     withListContent: (NSArray*) _listContent;

@end
