//
//  MTCMeliItemService.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 25/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTCMeliServiceApi.h"
#import "MTCMeliServiceApiItemDelegate.h"

@interface MTCMeliServiceApiItem : MTCMeliServiceApi

@property (nonatomic, copy) NSString *path;
//@property (nonatomic, assign) id <MTCMeliServiceApiItemDelegate> *delegate;

+ (instancetype)meliServiceApiItemWithIdentifier:(NSString *)idItem withAttributes:(NSArray *)atributes withDelegate:(id <MTCMeliServiceApiItemDelegate> )delegate;
+ (instancetype)meliServiceApiItemWithIdentifiers:(NSArray *)idsItem withDelegate:(id <MTCMeliServiceApiItemDelegate> )delegate;

@end
