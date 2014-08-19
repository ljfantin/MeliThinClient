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
    MTCFavoriteManager * favoriteManager = [MTCFavoriteManager sharedInstance];
    NSArray * idFavorites = [favoriteManager arrayWithObjectsWithId];
    [self itemsWithIdentifiers:idFavorites];
    //prodria verificar si alguno no existe mas
}

- (void) addBookmark:(MTCItemDto*)item withToken:(NSString*)token
{
    MTCFavoriteManager * dao = [MTCFavoriteManager sharedInstance];
    [dao saveFavoriteIdentifier:item.identifier];
    [dao commit];
}

- (void) removeBookmark:(MTCItemDto*)item withToken:(NSString*)token
{
    MTCFavoriteManager * dao = [MTCFavoriteManager sharedInstance];

    [dao deleteFavoriteIdentifier:item.identifier];
    [dao commit];
}

- (void) removeAllBookmark:(NSString*)token
{
    MTCFavoriteManager * dao = [MTCFavoriteManager sharedInstance];

    [dao deleteAllFavoritesIdentifiers];
    [dao commit];
}


@end
