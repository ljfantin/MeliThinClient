//
//  MTCMeliServiceOperation.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 25/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//
#import "AFHTTPRequestOperation.h"

#import "MTCMeliServiceOperation.h"

@interface MTCMeliServiceOperation ()  

@property (nonatomic,retain) AFHTTPRequestOperation * operation;

@end

@implementation MTCMeliServiceOperation


- (instancetype) initWithGetHttpMethodAndPath:(NSString*)path andWithParameter:(NSDictionary*)parameters
{
    self = [super init];
    if (self) {
        NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:url parameters:parameters error:nil];
        //Ver esto !!!
        self.operation = [[[AFHTTPRequestOperation alloc] initWithRequest:request] autorelease];
        self.operation.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return self;
}

- (instancetype) initWithPostHttpMethodAndPath:(NSString*)path andWithParameter:(NSDictionary*)parameters
{
    self = [super init];
    if (self) {
        NSMutableString *completeUrl = [NSMutableString stringWithString:self.url];
        [completeUrl appendString:path];

        NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:url parameters:parameters error:nil];
        //Ver esto !!!
        self.operation = [[[AFHTTPRequestOperation alloc] initWithRequest:request] autorelease];
        self.operation.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return self;
}

- (void) run
{
    [self.operation start];
}


- (BOOL) isRunning
{
    return [self.operation isExecuting];
}


- (void) cancel
{
    [self.operation cancel];
}

@end
