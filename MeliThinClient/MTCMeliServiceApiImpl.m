//
//  MTCMeliServiceApiImpl.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCMeliServiceApiImpl.h"
#import "AFHTTPRequestOperationManager.h"
#import "MTCItemSearchResultDto.h"
#import "UIImage+Utils.h"
#import "MTCSearchJsonTranslator.h"
#import "MTCPicturesJsonTranslator.h"
#import "MTCPagerList.h"
#import "MTCItemDto.h"


@implementation MTCMeliServiceApiImpl

@synthesize delegate;

- (instancetype)init {
	self = [super init];
	if (self) {
		//TODO Hacer una clase que levante propiedades de un archivo
		_url = @"https://api.mercadolibre.com/";
		_pathSearch = @"sites/MLA/search";
		_pathItems = @"items/%@/";
		_pathMultiGetsItems = @"items";
		_pathDescription =  @"items/%@/description";
	}
	return self;
}

//TODO Ver si puedo hacer un metodo generico que haga un GET y desde este llamarlo
- (void)search:(NSString *)query pager:(MTCPagerList *)pager {
	[self preExecute];
	if (![self hasConecction]) {
		[self handleErrorWithOutConnection];
	}
	else {
		//agrego parametros
		NSString *limitValue = [@(pager.limit)stringValue];
		NSString *offSetValue = [@(pager.offset)stringValue];
		NSDictionary *params = @{ @"q":query, @"limit":limitValue, @"offset":offSetValue };
		//construyo el request
		AFHTTPRequestOperation *op = [self buildRequest:@"GET" path:self.pathSearch parameters:params];

		__weak MTCMeliServiceApiImpl *weakSelf = self;
		[op setCompletionBlockWithSuccess: ^(AFHTTPRequestOperation *operation, id responseObject) {
		    NSLog(@"Respuesta json search %@: %@", query, responseObject);
		    [[weakSelf getDelegate] onPostExecute:responseObject];
		} failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
		    [weakSelf handleError:error];
		}];
		[[NSOperationQueue mainQueue] addOperation:op];
	}
}

- (void)itemWithIdentifier:(NSString *)idItem attributes:(NSArray *)atributes  {
	[self preExecute];
	if (![self hasConecction]) {
		[self handleErrorWithOutConnection];
	}
	else {
		//agrego parametros
		NSDictionary *params =  nil;
		if (atributes != nil) {
			NSString *attributesJoined = [atributes componentsJoinedByString:@","];
			params = @{ @"attributes":attributesJoined };
		}

		NSString *pathPicturesWithId = [NSString stringWithFormat:self.pathItems, idItem];

		//construyo el request
		AFHTTPRequestOperation *op = [self buildRequest:@"GET" path:pathPicturesWithId parameters:params];

		__weak MTCMeliServiceApiImpl *weakSelf = self;
		[op setCompletionBlockWithSuccess: ^(AFHTTPRequestOperation *operation, id responseObject) {
		    [[weakSelf getDelegate] onPostExecute:responseObject];
		} failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
		    [weakSelf handleError:error];
		}];
		[[NSOperationQueue mainQueue] addOperation:op];
	}
}

- (void)itemsWithIdentifiers:(NSArray *)idsItem {
	[self preExecute];
	if (![self hasConecction]) {
		[self handleErrorWithOutConnection];
	}
	else {
		//agrego parametros
		NSDictionary *params =  nil;
		if (idsItem != nil) {
			NSString *attributesJoined = [idsItem componentsJoinedByString:@","];
			params = @{ @"ids":attributesJoined };
		}

		NSString *pathMultigetItems = [NSString stringWithFormat:self.pathMultiGetsItems, params];

		//construyo el request
		AFHTTPRequestOperation *op = [self buildRequest:@"GET" path:pathMultigetItems parameters:params];

		__weak MTCMeliServiceApiImpl *weakSelf = self;
		[op setCompletionBlockWithSuccess: ^(AFHTTPRequestOperation *operation, id responseObject) {
		    [[weakSelf getDelegate] onPostExecute:responseObject];
		} failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
		    [weakSelf handleError:error];
		}];
		[[NSOperationQueue mainQueue] addOperation:op];
	}
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

		__weak MTCMeliServiceApiImpl *weakSelf = self;
		[op setCompletionBlockWithSuccess: ^(AFHTTPRequestOperation *operation, id responseObject) {
		    [[weakSelf getDelegate] onPostExecute:responseObject];
		} failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
		    [weakSelf handleError:error];
		}];
		[[NSOperationQueue mainQueue] addOperation:op];
	}
}

- (void)setDelegate:(id <MTCServiceApiDelegate> )newDelegate {
	delegate = newDelegate;
}

- (id <MTCServiceApiDelegate> )getDelegate {
	return delegate;
}

- (AFHTTPRequestOperation *)buildRequest:(NSString *)httpMethod path:(NSString *)path parameters:(NSDictionary *)parameters;
{
	//construyo url
	NSMutableString *urlSearch = [NSMutableString stringWithString:self.url];
	[urlSearch appendString:path];

	NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:httpMethod URLString:urlSearch parameters:parameters error:nil];
	AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
	op.responseSerializer = [AFJSONResponseSerializer serializer];
	return op;
}

- (void)preExecute {
	////Si el delegate tiene implementado onPreExecute
	if ([[self getDelegate] respondsToSelector:@selector(onPreExecute)]) {
		[[self getDelegate] onPreExecute];
	}
}

- (BOOL)hasConecction {
	return ([[AFNetworkReachabilityManager sharedManager] isReachable]);
}

- (void)handleError:(NSError *)error {
	NSLog(@"Error: %@", error);
	//Si el delegate tiene implementado el manejo de errores genericos entonces lo invoco.
	if ([[self getDelegate] respondsToSelector:@selector(onHandleError:)]) {
		[[self getDelegate] onHandleError:error];
	}
}

- (void)handleErrorWithOutConnection {
	NSLog(@"Error: Se corto la conexion");
	//Si el delegate tiene implementado el manejo de errores para cuando se corta la conexion
	if ([[self getDelegate] respondsToSelector:@selector(onHandleErrorWithOutConnection)]) {
		[[self getDelegate] onHandleErrorWithOutConnection];
	}
}

@end
