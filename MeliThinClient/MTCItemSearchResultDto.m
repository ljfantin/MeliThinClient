//
//  MTCItemDto.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCItemSearchResultDto.h"

@implementation MTCItemSearchResultDto

+(instancetype) mtcItemSearchResultDtoWithId:(NSString*)id title:(NSString *) title price:(NSNumber*) price subtitle:(NSString*) subtitle  availableQuantity:(NSNumber*)quantity condition:(MTCConditiontTypeDto*)condition buyingMode:(MTCBuyingModeTypeDto*)buyingMode currency:(MTCCurrencyTypeDto*)currency thumbnail:(UIImage*) image
{
    
    MTCItemSearchResultDto * item = [[[MTCItemSearchResultDto alloc] init] autorelease];

    if (item!=nil && ![title isEqual:[NSNull null]]) {
        item.id = id;
    }
    if (title!=nil && ![title isEqual:[NSNull null]]) {
        item.tittle = title;
    }
    if (price!=nil && ![price isEqual:[NSNull null]]) {
        item.price = price;
    }
    if (subtitle!=nil && ![subtitle isEqual:[NSNull null]]) {
        item.subtitle = subtitle;
    }
    if (quantity!=nil && ![quantity isEqual:[NSNull null]]) {
        item.availableQuantity = quantity;
    }
    if (condition!=nil) {
        item.condition = condition;
    }
    if (buyingMode!=nil) {
        item.buyingMode = buyingMode;
    }
    if (image!=nil && ![image isEqual:[NSNull null]]) {
        item.thumbnail = image;
    }
    if (currency!=nil) {
        item.currency = currency;
    }
    return item;
}

- (void)dealloc
{
    [_id release];
    _id = nil;
    [_tittle release];
    _tittle = nil;
    [_price release];
    _price = nil;
    [_subtitle release];
    _subtitle = nil;
    [_availableQuantity release];
    _availableQuantity = nil;
    [_thumbnail release];
    _thumbnail = nil;
    [_currency release];
    _currency = nil;
    [_buyingMode release];
    _buyingMode = nil;
    [_condition release];
    _condition = nil;
    [super dealloc];
}

@end
