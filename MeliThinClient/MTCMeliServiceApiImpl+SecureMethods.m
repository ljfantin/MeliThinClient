//
//  MTCMeliServiceApiImpl+SecureMethods.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 12/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCMeliServiceApiImpl+SecureMethods.h"
#import "MTCItemDto.h"
#import "MTCFavoriteDaoImpl.h"


@implementation MTCMeliServiceApiImpl (SecureMethods)

- (void) getAllBookmarks:(NSString*)token{
    MTCFavoriteDaoImpl * dao = [MTCFavoriteDaoImpl sharedInstance];
    NSArray * idFavorites = [dao getAll];
    [self getItems:idFavorites];
    //prodria verificar si alguno no existe mas
}

- (void) addBookmark:(MTCItemDto*)item withToken:(NSString*)token
{
    MTCFavoriteDaoImpl * dao = [MTCFavoriteDaoImpl sharedInstance];
    [dao save:item.id];
    [dao commit];
}

- (void) removeBookmark:(MTCItemDto*)item withToken:(NSString*)token
{
    MTCFavoriteDaoImpl * dao = [MTCFavoriteDaoImpl sharedInstance];

    [dao delete:item.id];
    [dao commit];
}

- (void) removeAllBookmark:(NSString*)token
{
    MTCFavoriteDaoImpl * dao = [MTCFavoriteDaoImpl sharedInstance];

    [dao deleteAll];
    [dao commit];
}


@end
