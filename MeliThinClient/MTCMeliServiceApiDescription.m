//
//  MTCMeliDescriptionService.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 25/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCMeliServiceApiDescription.h"

@implementation MTCMeliServiceApiDescription

- (instancetype)init {
	self = [super init];
	if (self) {
		self.path =  @"items/%@/description";
	}
	return self;
}

- (void)descriptionFromItemWithIdentifier:(NSString *)idIdem {
	[self preExecute];
	if (![self hasConecction]) {
		[self handleErrorWithOutConnection];
	}
	else {
		NSString *pathPicturesWithId = [NSString stringWithFormat:self.pathDescription, idIdem];

		//construyo el request
		AFHTTPRequestOperation *op = [self buildRequest:@"GET" path:pathPicturesWithId parameters:nil];

		__block MTCMeliServiceApi *weakSelf = self;
		[op setCompletionBlockWithSuccess: ^(AFHTTPRequestOperation *operation, id responseObject) {
		    [[weakSelf getDelegate] onPostExecute:responseObject];
		} failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
		    [weakSelf handleError:error];
		}];
		[[NSOperationQueue mainQueue] addOperation:op];
	}
}

@end
