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

- (instancetype)init {
	self = [super init];
	if (self) {
		//TODO Hacer una clase que levante propiedades de un archivo
		self.url = @"https://api.mercadolibre.com/";
	}
	return self;
}

- (void)buildRequest:(NSString *)httpMethod path:(NSString *)path parameters:(NSDictionary *)parameters;
{
	//construyo url
	NSMutableString *completeUrl = [NSMutableString stringWithString:self.url];
	[completeUrl appendString:path];

	NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:httpMethod URLString:completeUrl parameters:parameters error:nil];
	//Ver esto !!!
	self.operation = [[[AFHTTPRequestOperation alloc] initWithRequest:request] autorelease];
	self.operation.responseSerializer = [AFJSONResponseSerializer serializer];
}

- (void)cancelOperation {
	[self.operation cancel];
}

- (BOOL)hasConecction {
	return ([[AFNetworkReachabilityManager sharedManager] isReachable]);
}

/*- (void)preExecute {
   ////Si el delegate tiene implementado onPreExecute
   if ([[self getDelegate] respondsToSelector:@selector(onPreExecute)]) {
   [[self getDelegate] onPreExecute];
   }
   }*/

/*- (void)handleError:(NSError *)error {
    NSLog(@"Error: %@", error);
    //Si el delegate tiene implementado el manejo de errores genericos entonces lo invoco.
    if ([[self getDelegate] respondsToSelector:@selector(onHandleError:)]) {
        [[self getDelegate] onHandleError:error];
    }
   }*/

/*- (void)handleErrorWithOutConnection {
    NSLog(@"Error: Se corto la conexion");
    //Si el delegate tiene implementado el manejo de errores para cuando se corta la conexion
    if ([[self getDelegate] respondsToSelector:@selector(onHandleErrorWithOutConnection)]) {
        [[self getDelegate] onHandleErrorWithOutConnection];
    }
   }*/

- (void)dealloc {
	[_url release];
	_url = nil;
	[super dealloc];
}

@end
