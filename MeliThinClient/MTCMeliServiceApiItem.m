//
//  MTCMeliItemService.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 25/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCMeliServiceApiItem.h"

@implementation MTCMeliServiceApiItem

- (instancetype)init {
	self = [super init];
	if (self) {
		self.path = @"items/%@/";
	}
	return self;
}

- (void)itemWithIdentifier:(NSString *)idItem attributes:(NSArray *)atributes
{
    //agrego parametros
    NSDictionary *params =  nil;
    if (atributes != nil) {
        NSString *attributesJoined = [atributes componentsJoinedByString:@","];
        params = @{ @"attributes":attributesJoined };
    }

    NSString *pathPicturesWithId = [NSString stringWithFormat:self.path, idItem];

    //construyo el request
    AFHTTPRequestOperation *op = [self buildRequest:@"GET" path:pathPicturesWithId parameters:params];

    __block MTCMeliServiceApi *weakSelf = self;
    [op setCompletionBlockWithSuccess: ^(AFHTTPRequestOperation *operation, id responseObject) {
		    [[weakSelf getDelegate] onPostExecute:responseObject];
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
		    [weakSelf handleError:error];
    }];
    [[NSOperationQueue mainQueue] addOperation:op];
}

- (void)itemsWithIdentifiers:(NSArray *)idsItem {
	
    //agrego parametros
    NSDictionary *params =  nil;
    if (idsItem != nil) {
        NSString *attributesJoined = [idsItem componentsJoinedByString:@","];
        params = @{ @"ids":attributesJoined };
    }

    NSString *pathMultigetItems = [NSString stringWithFormat:self.pathMultiGetsItems, params];

    //construyo el request
    AFHTTPRequestOperation *op = [self buildRequest:@"GET" path:pathMultigetItems parameters:params];

    __block MTCMeliServiceApi *weakSelf = self;
    [op setCompletionBlockWithSuccess: ^(AFHTTPRequestOperation *operation, id responseObject) {
        [[weakSelf getDelegate] onPostExecute:responseObject];
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
		    [weakSelf handleError:error];
    }];
    [[NSOperationQueue mainQueue] addOperation:op];
}

@end
