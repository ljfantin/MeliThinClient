//
//  MTCMeliServiceApiImpl.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTCSearchJsonTranslator.h"
#import "MTCItemTranslator.h"
#import "AFHTTPRequestOperation.h"

@interface MTCMeliServiceApiImpl : NSObject

@property (nonatomic, copy) NSString *url;
@property (nonatomic, retain) AFHTTPRequestOperation *operation;

/*
   - (void)handleErrorWithOutConnection;
   - (void)handleError:(NSError *)error;
   - (BOOL)hasConecction;
 */
- (void)buildRequest:(NSString *)httpMethod path:(NSString *)path parameters:(NSDictionary *)parameters;
- (void)cancelOperation;

@end
