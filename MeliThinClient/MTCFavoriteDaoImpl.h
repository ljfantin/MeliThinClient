//
//  MTCFavoriteDaoImpl.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 12/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTCFavoriteDao.h"

@interface MTCFavoriteDaoImpl : NSObject<MTCFavoriteDao>
+ (MTCFavoriteDaoImpl*) sharedInstance;

@end
