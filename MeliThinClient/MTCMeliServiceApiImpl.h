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
#import "MTCSearchJsonTranslator.h"
#import "MTCItemTranslator.h"

@interface MTCMeliServiceApiImpl : NSObject<MTCMeliServiceApi>{

    id<MTCServiceApiDelegate> delegate;
}

@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSString * pathSearch;
@property (nonatomic, retain) NSString * pathItems;
@property (nonatomic, retain) NSString * pathDescription;
@property (nonatomic, retain) NSString * pathMultiGetsItems;


@end
