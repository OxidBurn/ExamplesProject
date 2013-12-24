//
//  Utils.m
//  Deal
//
//  Created by Chaban Nikolay on 12/6/13.
//  Copyright (c) 2013 4Spin. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (void) showAlertWithText: (NSString*) text
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle: @""
                                                    message: text
                                                   delegate: nil
                                          cancelButtonTitle: @"Ok"
                                          otherButtonTitles: nil, nil];
    
    [alert show];
}

@end
