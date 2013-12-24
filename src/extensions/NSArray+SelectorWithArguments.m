//
//  NSArray+SelectorWithArguments.m
//  Ahrefs
//
//  Created by Dmitry Svishchov on 20/08/12
//  Copyright (c) 2012 Prophonix. All rights reserved
//


@implementation NSArray(SelectorWithArguments)


- (void) makeObjectsPerformSelector: (SEL)   selector
  										withArguments: (void*) arg1, ...
{
	va_list argList;
	
	// Copy objects to avoid mutation during enumeration
	NSArray* currObjects = [NSArray arrayWithArray: self];
	
	// Iterate through the list of objects
	for (id object in currObjects)
	{
		if ([object respondsToSelector: selector])
		{
			// Create method signature for each object class
			NSMethodSignature* signature = [[object class] instanceMethodSignatureForSelector: selector];
			
			// Create invocation with created signature
			NSInvocation* invocation = [NSInvocation invocationWithMethodSignature: signature];
			
			// Set target/selector
			[invocation setSelector: selector];
			[invocation setTarget:   object];
			
			if (arg1 != nil)
			{
				// Start variable size list of arguments
				va_start(argList, arg1);
				
				char* arg = arg1;
				
				// Iterate through the list of arguments and set them
				for (int i = 2; i < [signature numberOfArguments]; i++) 
				{
					const char* type = [signature getArgumentTypeAtIndex: i];
					NSUInteger size, align;
					NSGetSizeAndAlignment(type, &size, &align);
					NSUInteger mod = (NSUInteger)arg % align;
					
					if (mod != 0)
						arg += (align - mod);
					
					[invocation setArgument: arg atIndex: i];
					
					arg = (i == 2) ? (char*)argList : (arg + size);
				}
				
				va_end(argList);
			}
			
			// Retain arguments
			[invocation retainArguments];
			
			// Perform selector using created invocation
			[invocation invoke];
		}
	}
}


- (void) makeObjectsPerformSelector: (SEL)   selector
							  			 withArgument: (void*) arg
{
	[self makeObjectsPerformSelector: selector
										 withArguments: arg, nil];
}


@end