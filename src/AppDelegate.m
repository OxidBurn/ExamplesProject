//
//  AppDelegate.m
//  ExamplesProject
//
//  Created by Chaban Nikolay on 12/23/13.
//  Copyright (c) 2013 On Sight. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseNavigationController.h"
#import "RootViewController.h"
#import <TestFlightSDK/TestFlight.h>

void uncaughtExceptionHandler (NSException* exception);

void uncaughtExceptionHandler (NSException* exception)
{
    NSLog(@"%@", [NSString stringWithFormat: @"Unhandled Exception:\n%@", exception]);
    NSLog(@"%@", [NSString stringWithFormat: @"Stack Trace:\n%@", [exception callStackSymbols]]);
}

@interface AppDelegate()

// properties

/**
 *  Root navigation view controller
 */
@property (nonatomic, strong) BaseNavigationController* navController;

/**
 *  Root controller
 */
@property (nonatomic, strong) RootViewController* rootController;

// methods

/**
 *  Setup app defaults
 */
- (void) setupDefaults;

@end

@implementation AppDelegate

- (BOOL)           application: (UIApplication*) application
 didFinishLaunchingWithOptions: (NSDictionary*)  launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    
    // Init root controller
    //
    self.rootController = [[RootViewController alloc] init];
    
    // Init base root navigation controller
    //
    self.navController = [[BaseNavigationController alloc] initWithRootViewController: self.rootController];
    
    self.window.backgroundColor    = [UIColor whiteColor];
    self.window.rootViewController = self.navController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

/**
 *  Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
 *  @param application UIApplication ref
 */
- (void) applicationWillResignActive: (UIApplication*) application
{

}

/**
 *  Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
 *  @param application UIApplication ref
 */
- (void) applicationDidEnterBackground: (UIApplication*) application
{

}

/**
 *  Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
 *  @param application UIApplication ref
 */
- (void) applicationWillEnterForeground: (UIApplication*) application
{

}

/**
 *  Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
 *  @param application UIApplication ref
 */
- (void) applicationDidBecomeActive: (UIApplication*) application
{

}

/**
 *  Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
 *  @param application UIApplication ref
 */
- (void) applicationWillTerminate: (UIApplication*) application
{

}


#pragma mark - Defaults -

/**
 *  Setup defaults values
 */
- (void) setupDefaults
{
#ifdef __DEBUG__
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
#else
    [TestFlight takeOff: @""]; // need add token
#endif
}

@end
