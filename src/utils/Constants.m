//
//  Constants.m
//  ExamplesProject
//
//  Created by Chaban Nikolay on 12/24/13.
//  Copyright (c) 2013 On Sight. All rights reserved.
//

#import "Constants.h"

@implementation Constants

+ (NSString*) pathToExamplesList
{
    return [[NSBundle mainBundle] pathForResource: @"ExamplesList" ofType: @"plist"];
}

@end
