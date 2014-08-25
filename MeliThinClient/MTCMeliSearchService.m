//
//  MTCMeliSearchService.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 25/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCMeliSearchService.h"

@implementation MTCMeliSearchService

- (instancetype)init {
	self = [super init];
	if (self) {
		self.path = @"sites/MLA/search";
	}
	return self;
}

//TODO Ver si puedo hacer un metodo generico que haga un GET y desde este llamarlo
- (void)search:(NSString *)query pager:(MTCPagerList *)pager {
	/*[self preExecute];
	   if (![self hasConecction]) {
	    [self handleErrorWithOutConnection];
	   }
	   else {*/
	//agrego parametros
	NSString *limitValue = [@(pager.limit)stringValue];
	NSString *offSetValue = [@(pager.offset)stringValue];
	NSDictionary *params = @{ @"q":query, @"limit":limitValue, @"offset":offSetValue };
	//construyo el request
	AFHTTPRequestOperation *op = [self buildRequest:@"GET" path:self.pathSearch parameters:params];
    
	__block MTCMeliServiceApiImpl *weakSelf = self;
	[op setCompletionBlockWithSuccess: ^(AFHTTPRequestOperation *operation, id responseObject) {
	    NSLog(@"Respuesta json search %@: %@", query, responseObject);
	    [[weakSelf getDelegate] onPostExecute:responseObject];
	} failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
	    [weakSelf handleError:error];
	}];
	[[NSOperationQueue mainQueue] addOperation:op];
	//}
}

@end
