//
//  Constance.h
//  DoctorApp
//
//  Created by Chaban Nickolay on 9/16/13.
//  Copyright (c) 2013 Chaban Nickolay. All rights reserved.
//

#import "DataManager.h"

#import <Reachability/Reachability.h>
#import "NSArray+SelectorWithArguments.h"
#import "NSDictionary+Safe.h"

#import <CoreData/CoreData.h>


@interface DataManager()

//! Listeners
@property (nonatomic, retain) NSMutableArray* listeners;

//! Server reachability
@property (nonatomic, retain) Reachability* reachability;


//! Managed object model
@property (nonatomic, retain) NSManagedObjectModel* managedObjectModel;

//! Managed object context
@property (nonatomic, retain) NSManagedObjectContext* managedObjectContext;

//! Persistent store coordinator
@property (nonatomic, retain) NSPersistentStoreCoordinator* persistentStoreCoordinator;

//! Persistent store URL
@property (nonatomic, readonly) NSURL* persistentStoreURL;

// methods

@end


@implementation DataManager

@synthesize listeners;
@synthesize reachability;
@synthesize managedObjectModel;
@synthesize managedObjectContext;
@synthesize persistentStoreCoordinator;

@dynamic online;
@dynamic persistentStoreURL;


#pragma mark - General -

+ (DataManager*) shared
{
	static DataManager* sharedInstance = nil;
	static dispatch_once_t onceToken;
	
	dispatch_once(&onceToken, ^
	{
		sharedInstance = [[DataManager alloc] init];
	});
  
  return sharedInstance;
}


- (id) init
{
	self = [super init];

	if (self)
	{
		self.listeners = [NSMutableArray array];
    
		// Create reachability to the server
		self.reachability = [Reachability reachabilityForInternetConnection];
	}

	return self;
}


#pragma mark - Listeners -

- (void) addListener: (id <DataManagerListener>) listener
{
	// Add listener only if it doesn't already exist
	if ([self.listeners indexOfObject: listener] == NSNotFound)
		[self.listeners addObject: listener];
}


- (void) removeListener: (id <DataManagerListener>) listener
{
	// Remove listener only if it does exist
	if ([self.listeners indexOfObject: listener] != NSNotFound)
		[self.listeners removeObject: listener];
}


#pragma mark - Network -


- (BOOL) online
{
	return [self.reachability isReachable];
}


#pragma mark - Database -


- (NSURL*) persistentStoreURL
{
  return [NSURL fileURLWithPath: [NSString stringWithFormat: @"%@/Documents/MobKalendorius.sqlite", NSHomeDirectory()]];
}


- (NSManagedObjectContext*) managedObjectContext
{
	if (managedObjectContext != nil)
		return managedObjectContext;
	
	NSPersistentStoreCoordinator* coordinator = [self persistentStoreCoordinator];
  
	if (coordinator != nil)
	{
		managedObjectContext = [[NSManagedObjectContext alloc] init];
    
    managedObjectContext.persistentStoreCoordinator = coordinator;
    managedObjectContext.undoManager                = nil;
	}
	
	return managedObjectContext;
}


- (NSManagedObjectModel*) managedObjectModel
{
	if (managedObjectModel != nil)
		return managedObjectModel;
  
	managedObjectModel = [NSManagedObjectModel mergedModelFromBundles: nil];
  
	return managedObjectModel;
}


- (NSPersistentStoreCoordinator*) persistentStoreCoordinator
{
	if (persistentStoreCoordinator != nil)
		return persistentStoreCoordinator;
	
	persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: self.managedObjectModel];
  
  if (![self addPersistenStore])
  {
    [self clearDatabase];
		
    [self addPersistenStore];
  }
	
	return persistentStoreCoordinator;
}


- (BOOL) addPersistenStore
{
	NSError* error = nil;
	[persistentStoreCoordinator addPersistentStoreWithType: NSSQLiteStoreType
                                             configuration: nil
                                                       URL: self.persistentStoreURL
                                                   options: nil
                                                     error: &error];
        
  if (error)
		NSLog(@"Failed to add persistent store; error: %@\n  info: %@", error, error.userInfo);
	
  return !error;
}


- (void) clearDatabase
{
  // Remove persistent store (underlying sqlite database)
  [[NSFileManager defaultManager] removeItemAtURL: self.persistentStoreURL
                                            error: nil];
  
  // Null database linked objects
  self.managedObjectContext       = nil;
  self.managedObjectModel         = nil;
  self.persistentStoreCoordinator = nil;
}


- (NSError*) saveContext
{
	NSError* error = nil;
  
	[self.managedObjectContext save: &error];
  
  if (error != nil)
    NSLog(@"Error saving managed context: %@", error);
	
	return error;
}


- (void) resetContext
{
  [self.managedObjectContext reset];
}


- (void) refreshObjects: (NSArray*) objects
{
  for (NSManagedObject* object in objects)
    [self.managedObjectContext refreshObject: object mergeChanges: NO];
}


- (void) removeObject: (NSManagedObject*) object
{
  [self.managedObjectContext deleteObject: object];
  [self saveContext];
}


- (id) insertNewObjectForEntityForName: (NSString*) name
{
  if (name == nil)
    return nil;
  
  return [NSEntityDescription insertNewObjectForEntityForName: name
                                       inManagedObjectContext: self.managedObjectContext];
}


- (void) saveLocalChanges
{
  [self saveContext];
}


- (void) rollbackLocalChanges
{
  [self.managedObjectContext rollback];
}


#pragma mark - Fetch -

- (id) fetchObjectForEntityForName: (NSString*) name
                               uid: (NSString*) uid
{
  if (name == nil)
    return nil;
  
	NSEntityDescription* entity = [NSEntityDescription entityForName: name
                                              inManagedObjectContext: self.managedObjectContext];
	
	NSFetchRequest* request = [[NSFetchRequest alloc] init];
	request.entity = entity;
	
  if ([uid length])
  {
    NSPredicate* predicate = [NSPredicate predicateWithFormat: @"uid == %@", uid];
    request.predicate = predicate;
  }
	
	NSError* error;
	NSArray* results = [self.managedObjectContext executeFetchRequest: request error: &error];
	
	return [results count] ? [results objectAtIndex: 0] : nil;
}


- (id) fetchObjectsForEntityForName: (NSString*) name
{
  if (name == nil)
    return nil;
  
	NSEntityDescription* entity = [NSEntityDescription entityForName: name
                                              inManagedObjectContext: self.managedObjectContext];
	
	NSFetchRequest* request = [[NSFetchRequest alloc] init];
	request.entity = entity;
	
	NSError* error;
	NSArray* results = [self.managedObjectContext executeFetchRequest: request error: &error];
	
	return results;
}

@end
