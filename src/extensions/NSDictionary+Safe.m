//
//  NSDictionary+Safe.m
//
//  Created by Ignacio Romero Zurbuchen on 2/8/13.
//  Copyright (c) 2011 DZen Interaktiv.
//  Licence: MIT-Licence
//  http://opensource.org/licenses/MIT
//

#import "NSDictionary+Safe.h"

@implementation NSDictionary (Safe)

- (id)safeObjectForKey:(id)aKey
{
    id object = [self objectForKey:aKey];
    if ([object isKindOfClass:[NSNull class]] || !object) return nil;
    else return object;
}

@end
