//
//  MTCMeliItemService.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 25/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTCMeliServiceApiImpl.h"
#import "MTCMeliServiceApiItemDelegate.h"

@interface MTCMeliItemService : MTCMeliServiceApiImpl

@property (nonatomic, copy) NSString *path;
@property (nonatomic, assign) id <MTCMeliServiceApiItemDelegate> *delegate;

- (void)itemWithIdentifier:(NSString *)idItem attributes:(NSArray *)atributes;
- (void)itemsWithIdentifiers:(NSArray *)idsItem;

@end
