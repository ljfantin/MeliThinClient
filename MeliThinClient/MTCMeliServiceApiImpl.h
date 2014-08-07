//
//  MTCMeliServiceApiImpl.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTCMeliServiceApi.h"
#import "MTCServiceApiDelegate.h"

@interface MTCMeliServiceApiImpl : NSObject<MTCMeliServiceApi>{

    id<MTCServiceApiDelegate> delegate;
}

@property (nonatomic, retain) NSString * url;


@end
