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
    NSArray * idFavorites = [[MTCFavoriteDaoImpl sharedInstance] getAll];
    [self getItems:idFavorites];
    //prodria verificar si alguno no existe mas
}

- (void) addBookmark:(MTCItemDto*)item withToken:(NSString*)token
{
    [[MTCFavoriteDaoImpl sharedInstance] save:item.id];
    [[MTCFavoriteDaoImpl sharedInstance] commit];
}

- (void) removeBookmark:(MTCItemDto*)item withToken:(NSString*)token
{
    [[MTCFavoriteDaoImpl sharedInstance] delete:item.id];
    [[MTCFavoriteDaoImpl sharedInstance] commit];

}

- (void) removeAllBookmark:(NSString*)token
{
    [[MTCFavoriteDaoImpl sharedInstance] deleteAll];
    [[MTCFavoriteDaoImpl sharedInstance] commit];
}

@end
