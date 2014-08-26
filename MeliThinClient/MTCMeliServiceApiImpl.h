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

@interface MTCMeliServiceApiImpl : NSObject <MTCMeliServiceApi>

@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *pathSearch;
@property (nonatomic, strong) NSString *pathItems;
@property (nonatomic, strong) NSString *pathDescription;
@property (nonatomic, strong) NSString *pathMultiGetsItems;


@end
