//
//  MTCPriceFavoriteButtonVipItemViewTableViewCell.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 12/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCPriceFavoriteButtonVipItemViewTableViewCell.h"

@implementation MTCPriceFavoriteButtonVipItemViewTableViewCell


- (void)dealloc {
    [_priceLabel release];
    _priceLabel = nil;
    [_addFavoritesButton release];
    _addFavoritesButton = nil;
    [super dealloc];
}
@end
