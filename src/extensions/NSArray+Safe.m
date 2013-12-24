//
//  NSArray+Safe.m
//  ADedo
//
//  Created by Ignacio on 4/19/13.
//  Copyright (c) 2013 DZEN. All rights reserved.
//

#import "NSArray+Safe.h"

@implementation NSArray (Safe)

- (id)safeObjectAtIndex:(NSUInteger)index
{
    if ([self count] > 0)
    {
        if (index < [self count]) return [self objectAtIndex:index];
        else return nil;
    }
    else return nil;
}

@end
