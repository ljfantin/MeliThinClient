//
//  MTCFavoritesJsonTranslator.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 12/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTCSearchResultJsonTranslator.h"

@interface MTCFavoritesJsonTranslator : NSObject<MTCJsonTranslator>

@property (nonatomic,retain)MTCSearchResultJsonTranslator * resultJsonTranslator;

@end
