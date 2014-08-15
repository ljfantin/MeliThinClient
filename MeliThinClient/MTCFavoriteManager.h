//
//  MTCFavoriteDaoImpl.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 12/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTCFavoriteManager : NSObject
+ (MTCFavoriteManager*) sharedInstance;

- (void)saveFavoriteIdentifier:(NSString*)identifier;
- (void)deleteFavoriteIdentifier:(NSString*)identifier;
- (void)deleteAllFavoritesIdentifiers;
- (NSArray*)arrayWithObjectsWithId;
- (BOOL)commit;

@end
