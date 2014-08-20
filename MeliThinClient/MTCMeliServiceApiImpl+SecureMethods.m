//
//  MTCMeliServiceApiImpl+SecureMethods.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 12/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCMeliServiceApiImpl+SecureMethods.h"
#import "MTCItemDto.h"
#import "MTCFavoriteManager.h"


@implementation MTCMeliServiceApiImpl (SecureMethods)

- (void) getAllBookmarks:(NSString*)token{
    MTCFavoriteManager * manager = [MTCFavoriteManager sharedInstance];
    NSArray * idFavorites = [manager arrayWithObjectsWithId];
    [self itemsWithIdentifiers:idFavorites];
}

- (void) addBookmark:(MTCItemDto*)item withToken:(NSString*)token
{
    MTCFavoriteManager * manager = [MTCFavoriteManager sharedInstance];
    [manager saveFavoriteIdentifier:item.identifier];
    [manager commit];
}

- (void) removeBookmark:(MTCItemDto*)item withToken:(NSString*)token
{
    MTCFavoriteManager * manager = [MTCFavoriteManager sharedInstance];

    [manager deleteFavoriteIdentifier:item.identifier];
    [manager commit];
}

- (void) removeAllBookmark:(NSString*)token
{
    MTCFavoriteManager * manager = [MTCFavoriteManager sharedInstance];

    [manager deleteAllFavoritesIdentifiers];
    [manager commit];
}


@end
