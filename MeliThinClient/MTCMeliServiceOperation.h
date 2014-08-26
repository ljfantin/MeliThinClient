//
//  MTCMeliServiceOperation.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 25/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTCMeliServiceOperation : NSObject

@property (nonatomic,copy) NSString * url;

- (instancetype) initWithGetHttpMethodAndPath:(NSString*)path andWithParameter:(NSDictionary*)parameters;
- (instancetype) initWithPostHttpMethodAndPath:(NSString*)path andWithParameter:(NSDictionary*)parameters;
- (void) run;
- (BOOL) isRunning;
- (void) cancel;

@end
