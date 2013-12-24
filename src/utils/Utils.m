//
//  Utils.m
//  Deal
//
//  Created by Chaban Nikolay on 12/6/13.
//  Copyright (c) 2013 4Spin. All rights reserved.
//

#import "Utils.h"

@implementation Utils


#pragma mark - Alerts -

+ (void) showAlertWithText: (NSString*) text
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle: @""
                                                    message: text
                                                   delegate: nil
                                          cancelButtonTitle: @"Ok"
                                          otherButtonTitles: nil, nil];
    
    [alert show];
}


#pragma mark - Device -

+ (BOOL) canMakePhoneCalls
{
    static BOOL didCallMethod = NO;
    static BOOL canMakePhoneCalls;
    
    if (didCallMethod == NO)
    {
        didCallMethod = YES;
        canMakePhoneCalls = [[UIApplication sharedApplication] canOpenURL: [NSURL URLWithString: @"tel://"]];
    }
    
    return canMakePhoneCalls;
}


+ (BOOL) isRetina
{
    return ([[UIScreen mainScreen] respondsToSelector: @selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 2.0)) ? 1 : 0;
}

+ (NSUInteger) detectOSVersion
{
    static NSUInteger deviceSystemMajorVersion = -1;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        NSString *systemVersion = [UIDevice currentDevice].systemVersion;
        deviceSystemMajorVersion = [[systemVersion componentsSeparatedByString:@"."][0] intValue];
    });
    
    return deviceSystemMajorVersion;
}


+ (void) benchmark: (void(^)(void))block
              name: (NSString*)    name
{
    clock_t start = clock();
    
    block();
    
    double executionTime = (double)(clock()-start) / CLOCKS_PER_SEC;
    
    NSLog(@"%@ duration -> %.3f", name, executionTime);
}

+ (void) benchmark: (void(^)(void)) block
{
    [self benchmark: block name: @"Event"];
}


#pragma mark - Application -

+ (NSString*) applicationSupportDirectory
{
    NSFileManager* fm = [NSFileManager defaultManager];
    
    NSArray* paths = [fm URLsForDirectory: NSApplicationSupportDirectory
                                inDomains: NSUserDomainMask];
    
    NSString* basePath = ([paths count] > 0) ? [[[paths objectAtIndex:0] absoluteString] stringByReplacingOccurrencesOfString: @"file://localhost" withString: @""] : nil;
    
    if (basePath)
        basePath = [basePath stringByReplacingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    
    return basePath;
}

+ (void) printFont
{
    NSString* family,
    * font;
    
    for(family in [UIFont familyNames])
    {
        NSLog(@"\nFamily: %@", family);
        
        for(font in[UIFont fontNamesForFamilyName: family])
            NSLog(@"\tFont: %@\n", font);
    }
}


+ (void) findAndResignFirstReponder
{
    UIWindow* keyWindow = [[UIApplication sharedApplication] keyWindow];
    
    [self findAndResignFirstResponderFromView: keyWindow];
}


+ (BOOL) findAndResignFirstResponderFromView: (UIView*) view
{
    if (view.isFirstResponder)
    {
        [view resignFirstResponder];
        
        return YES;
    }
    
    for (UIView* subView in view.subviews)
    {
        if ([self findAndResignFirstResponderFromView: subView])
        {
            return YES;
        }
    }
    
    return NO;
}


#pragma mark - Fonts -

+ (UIFont*) lightFont: (NSUInteger) fontSize
{
    return [UIFont fontWithName: @"HelveticaNeue-Light"
                           size: fontSize];
}

+ (UIFont*) boldFont: (NSUInteger) fontSize
{
    return [UIFont fontWithName: @"HelveticaNeue-Bold"
                           size: fontSize];
}

+ (UIFont*) regularFont: (NSUInteger) fontSize
{
    return [UIFont fontWithName: @"HelveticaNeue"
                           size: fontSize];
}

@end
