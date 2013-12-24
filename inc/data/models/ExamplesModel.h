//
//  ExamplesModel.h
//  ExamplesProject
//
//  Created by Chaban Nikolay on 12/24/13.
//  Copyright (c) 2013 On Sight. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExamplesModel : NSObject

// properties

@property (nonatomic, copy) NSArray* (^listContent)();

// methods

/**
 *  Initialization with examples list dictionary
 *
 *  @param _examplesDictionary list dictionary
 *
 *  @return Examples model object
 */
- (id) initWithExamplesDictionary: (NSDictionary*) _examplesDictionary;


@end
