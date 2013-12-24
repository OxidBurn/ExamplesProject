//
//  ExamplesModel.m
//  ExamplesProject
//
//  Created by Chaban Nikolay on 12/24/13.
//  Copyright (c) 2013 On Sight. All rights reserved.
//

#import "ExamplesModel.h"
#import <BlocksKit/NSDictionary+BlocksKit.h>

@interface ExamplesModel()

// properties

/** Examples list dictionary
 */
@property (nonatomic, strong) NSDictionary* examplesDictionary;

// methods

/** Parcing dictionary
 */
- (void) parseData;

@end

@implementation ExamplesModel

// public properties
@synthesize listContent;

// private properties
@synthesize examplesDictionary;


#pragma mark - Initialization -

- (id) initWithExamplesDictionary: (NSDictionary*) _examplesDictionary
{
    if (self = [super init])
    {
        self.examplesDictionary = _examplesDictionary;
        
        // Parse data
        //
        [self parseData];
    }
    
    return self;
}


#pragma mark - Parsing -

- (void) parseData
{
    NSMutableArray* tmpArray = [NSMutableArray array];
    
    [self.examplesDictionary bk_each: ^(id key, id obj) {
        
        NSDictionary* tmpDic = @{@"title"       : key,
                                 @"Description" : obj};
        
        [tmpArray addObject: tmpDic];
        
    }];
    
    self.listContent = ^NSArray* (){
      
        return tmpArray;
        
    };
}


@end
