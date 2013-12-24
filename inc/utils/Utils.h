//
//  Utils.h
//  Deal
//
//  Created by Chaban Nikolay on 12/6/13.
//  Copyright (c) 2013 4Spin. All rights reserved.
//

#import <Foundation/Foundation.h>

// Custom logs
//
#define NSLog(args...) CustomLog(__FILE__, __LINE__, __PRETTY_FUNCTION__, args)
static inline void CustomLog(const char* file, int lineNumber, const char* functionName, NSString* format, ...)
{
    // Type to hold information about variable arguments.
    va_list ap;
    
    // Initialize a variable argument list.
    va_start (ap, format);
    
    // NSLog only adds a newline to the end of the NSLog format if
    // one is not already there.
    // Here we are utilizing this feature of NSLog()
    if (![format hasSuffix: @"\n"])
    {
        format = [format stringByAppendingString: @"\n"];
    }
    
    NSString* body = [[NSString alloc] initWithFormat: format
                                            arguments: ap];
    // End using variable argument list.
    va_end (ap);
    
    NSString* fileName = [[NSString stringWithUTF8String: file] lastPathComponent];
    
    fprintf(stderr, "(%s) (%s:%d) %s",
            functionName, [fileName UTF8String],
            lineNumber, [body UTF8String]);
}

// Device
//
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_5 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0f)
#define IS_IPHONE_4 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 480.0f)
#define IS_LANDSCAPE (UIDeviceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation))

// AutoLayout
//
#define AutoLayoutByPosition (UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin)
#define AutoLayoutBySize     (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth)
#define AutoLayoutAll        (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin)
#define AutoLayoutHorizontal (UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin)

// Color
//
#define RGB(r, g, b)     [UIColor colorWithRed: r/255.0 green: g/255.0 blue: b/255.0 alpha: 1.0]
#define RGBA(r, g, b, a) [UIColor colorWithRed: r/255.0 green: g/255.0 blue: b/255.0 alpha: a]

// App
//
#define UserDefaults                        [NSUserDefaults standardUserDefaults]
#define SharedApplication                   [UIApplication sharedApplication]
#define Bundle                              [NSBundle mainBundle]
#define MainScreen                          [UIScreen mainScreen]
#define ShowNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = YES
#define HideNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = NO
#define NetworkActivityIndicatorVisible(x)  [UIApplication sharedApplication].networkActivityIndicatorVisible = x
#define NavBar                              self.navigationController.navigationBar

@interface Utils : NSObject

// properties


// methods

/**
 *  Show alert with text
 *
 *  @param text alert message
 */
+ (void) showAlertWithText: (NSString*) text;

/** Checking can make device calls
 */
+ (BOOL) canMakePhoneCalls;

/** Get first responder
 */
+ (void) findAndResignFirstReponder;

+ (BOOL) findAndResignFirstResponderFromView: (UIView*) view;

/** Benchmark
 */
+ (void) benchmark: (void(^)(void))block
              name: (NSString*) name;

+ (void) benchmark:(void(^)(void))block;

/** Print all fonts
 */
+ (void) printFont;

/** Detect is retina screen
 */
+ (BOOL) isRetina;

/** Get support directory path
 */
+ (NSString*) applicationSupportDirectory;

/** Detect os version
 */
+ (NSUInteger) detectOSVersion;

/** Helvetica neue light font with size
 */
+ (UIFont*) lightFont: (NSUInteger) fontSize;

/** Helvetica neue bold font with size
 */
+ (UIFont*) boldFont: (NSUInteger) fontSize;

/** Helvetica neue regular font with size
 */
+ (UIFont*) regularFont: (NSUInteger) fontSize;

@end
