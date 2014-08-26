//
//  MTCMeliItemService.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 25/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCMeliServiceApiItem.h"

@implementation MTCMeliServiceApiItem


+ (instancetype)meliServiceApiItemWithIdentifier:(NSString *)idItem withAttributes:(NSArray *)atributes withDelegate:(id <MTCMeliServiceApiItemDelegate> )delegate {
	//agrego parametros
	NSDictionary *params =  nil;
	if (atributes != nil) {
		NSString *attributesJoined = [atributes componentsJoinedByString:@","];
		params = @{ @"attributes":attributesJoined };
	}

	NSString *pathWithIdItemAndAttributes = [NSString stringWithFormat:@"items/%@/", idItem];

	MTCMeliServiceApiItem *serviceApi = [[MTCMeliServiceApiItem alloc] initWithGetHttpMethodAndPath:pathWithIdItemAndAttributes andWithParameter:params];
	__block id <MTCMeliServiceApiItemDelegate> weakDelegate = delegate;
	[serviceApi.operation setCompletionBlockWithSuccess: ^(AFHTTPRequestOperation *operation, id responseObject) {
	    [weakDelegate onPostExecute:responseObject];
	} failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
	    //TODO hay warning
	    [weakDelegate handleError:error];
	}];

	return serviceApi;
}

+ (instancetype)meliServiceApiItemWithIdentifiers:(NSArray *)idsItem {
	//agrego parametros
	NSDictionary *params =  nil;
	if (idsItem != nil) {
		NSString *attributesJoined = [idsItem componentsJoinedByString:@","];
		params = @{ @"ids":attributesJoined };
	}

	NSString *pathMultigetItems = [NSString stringWithFormat:self.pathMultiGetsItems, params];

	MTCMeliServiceApiItem *serviceApi = [[MTCMeliServiceApiItem alloc] initWithGetHttpMethodAndPath:pathWithIdItemAndAttributes andWithParameter:params];
	__block id <MTCMeliServiceApiItemDelegate> weakDelegate = delegate;
	[serviceApi.operation setCompletionBlockWithSuccess: ^(AFHTTPRequestOperation *operation, id responseObject) {
	    [weakDelegate onPostExecute:responseObject];
	} failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
	    //TODO hay warning
	    [weakDelegate handleError:error];
	}];

	return serviceApi;
}

@end
