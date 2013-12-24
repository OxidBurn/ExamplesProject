//
//  NSArray+Query.m
//  ADedo
//
//  Created by Ignacio on 3/25/13.
//  Copyright (c) 2013 DZEN. All rights reserved.
//  Licence: MIT-Licence
//  http://opensource.org/licenses/MIT
//

#import "NSArray+Query.h"

@implementation NSArray (Query)

- (id)firstObject
{
    if ([self count] > 0) {
        return [self objectAtIndex:0];
    }
    return nil;
}

- (NSUInteger)lastObjectIndex
{
    return [self indexOfObject:[self lastObject]];
}

- (NSArray *)reversedArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    
    for (id element in enumerator) [array addObject:element];
    
    return array;
}

@end
