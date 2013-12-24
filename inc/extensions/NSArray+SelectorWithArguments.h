//
//  NSArray+SelectorWithArguments.h
//  Ahrefs
//
//  Created by Dmitry Svishchov on 20/08/12
//  Copyright (c) 2012 Prophonix. All rights reserved
//


@interface NSArray(SelectorWithArguments)

//! Make all objects in array perform selector with multiple arguments
- (void) makeObjectsPerformSelector: (SEL)   selector
							  			withArguments: (void*) arg1, ...;

//! Make all objects in array perform selector with single argument
- (void) makeObjectsPerformSelector: (SEL)   selector
							  			 withArgument: (void*) arg;

@end