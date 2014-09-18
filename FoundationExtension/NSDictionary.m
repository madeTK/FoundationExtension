//
//  NSDictionary.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 11. 1. 24..
//  Copyright 2011 youknowone.org All rights reserved.
//

#import "NSData.h"

#import "NSDictionary.h"

@implementation NSDictionary (Shortcuts)

- (id):(id)key {
    return self[key];
}

- (BOOL)containsKey:(id)key {
    return [self.allKeys containsObject:key];
}

@end


@implementation NSDictionary (NSData)

- (instancetype)initWithData:(NSData *)data {
    return [self initWithData:data format:NULL error:NULL];
}

+ (instancetype)dictionaryWithData:(NSData *)data {
    return [[[self alloc] initWithData:data] autorelease];
}

- (instancetype)initWithData:(NSData *)data format:(NSPropertyListFormat *)format error:(NSError **)error {
    NSDictionary *contents = [data propertyListObjectUsingFormat:format error:error];
    if (contents == nil) {
        [self release];
        return nil;
    }
    return [self initWithDictionary:contents];
}

+ (instancetype)dictionaryWithData:(NSData *)data format:(NSPropertyListFormat *)format error:(NSError **)error {
    return [[[self alloc] initWithData:data format:format error:error] autorelease];
}

@end
