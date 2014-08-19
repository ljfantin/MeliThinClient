//
//  MTCFavoritiesItemsResultsViewController.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTCAbtractListItemTableViewViewController.h"
#import "MTCFavoritesJsonTranslator.h"

@interface MTCItemsFavoritiesResultsViewController : MTCAbtractListItemTableViewViewController
@property (nonatomic, retain) MTCMeliServiceApiImpl * service;
@property (nonatomic, retain) MTCFavoritesJsonTranslator * favoritesJsonTranslator;
@end
