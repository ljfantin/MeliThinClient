//
//  MTCMeliServiceApiImpl.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//
#import "MTCMeliServiceApi.h"
#import "AFHTTPRequestOperationManager.h"
#import "MTCItemSearchResultDto.h"
#import "UIImage+Utils.h"
#import "MTCSearchJsonTranslator.h"
#import "MTCPicturesJsonTranslator.h"
#import "MTCPagerList.h"
#import "MTCItemDto.h"


@implementation MTCMeliServiceApi


- (instancetype)initWithGetHttpMethodAndPath:(NSString *)path andWithParameter:(NSDictionary *)parameters {
	self = [super init];
	if (self) {
		self.url = @"https://api.mercadolibre.com/";
		NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:self.url parameters:parameters error:nil];
		self.operation = [[[AFHTTPRequestOperation alloc] initWithRequest:request] autorelease];
		self.operation.responseSerializer = [AFJSONResponseSerializer serializer];
	}
	return self;
}

- (instancetype)initWithPostHttpMethodAndPath:(NSString *)path andWithParameter:(NSDictionary *)parameters {
	self = [super init];
	if (self) {
		self.url = @"https://api.mercadolibre.com/";
		NSMutableString *completeUrl = [NSMutableString stringWithString:self.url];
		[completeUrl appendString:path];

		NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:self.url parameters:parameters error:nil];
		self.operation = [[[AFHTTPRequestOperation alloc] initWithRequest:request] autorelease];
		self.operation.responseSerializer = [AFJSONResponseSerializer serializer];
	}
	return self;
}

- (void)run {
	[self.operation start];
}

- (BOOL)isRunning {
	return [self.operation isExecuting];
}

- (void)cancel {
	[self.operation cancel];
}

@end
