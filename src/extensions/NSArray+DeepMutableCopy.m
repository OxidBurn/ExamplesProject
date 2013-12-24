//
//  NSArray+DeepMutableCopy.m
//  Ahrefs
//
//  Created by Dmitry Svishchov on 20/08/12
//  Copyright (c) 2012 Prophonix. All rights reserved
//

#import "NSArray+DeepMutableCopy.h"


@implementation NSArray(DeepMutableCopy)


- (NSMutableArray*) deepMutableCopy
{
  return (NSMutableArray*)CFBridgingRelease(CFPropertyListCreateDeepCopy(kCFAllocatorDefault, (CFPropertyListRef)self, kCFPropertyListMutableContainers));
}


@end