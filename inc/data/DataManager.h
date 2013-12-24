//
//  Constance.h
//  DoctorApp
//
//  Created by Chaban Nickolay on 9/16/13.
//  Copyright (c) 2013 Chaban Nickolay. All rights reserved.
//

@protocol DataManagerListener;

@interface DataManager : NSObject

/** Checks whether we online or not
 */
@property (nonatomic, readonly) BOOL online;

/** Shared data manager
 */
+ (id) shared;

/** Add listener
 */
- (void) addListener: (id <DataManagerListener>) listener;

/** Remove listener
 */
- (void) removeListener: (id <DataManagerListener>) listener;

@end


@protocol DataManagerListener <NSObject>

@optional


@end