//
//  MTCServiceMeliApi.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MTCServiceMeliApi <NSObject>

-(NSArray*)search:(NSDictionary*)params;

@end
