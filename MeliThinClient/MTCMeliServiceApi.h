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
#import "MTCMeliServiceOperation.h"

@interface MTCMeliServiceApi : NSObject

@property (nonatomic, copy) NSString *url;
@property (nonatomic, retain) AFHTTPRequestOperation *operation;

- (instancetype)initWithGetHttpMethodAndPath:(NSString *)path andWithParameter:(NSDictionary *)parameters;

- (instancetype)initWithPostHttpMethodAndPath:(NSString *)path andWithParameter:(NSDictionary *)parameters;

- (void)run;
- (BOOL)isRunning;
- (void)cancel;

@end
