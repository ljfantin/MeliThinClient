//
//  MTCMeliServiceApiImpl.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTCMeliServiceApi.h"

@interface MTCMeliServiceApiImpl : NSObject<MTCServiceMeliApi>

@property (nonatomic, retain) NSString * url;

@end
