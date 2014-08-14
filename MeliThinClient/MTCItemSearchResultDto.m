//
//  MTCItemDto.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCItemSearchResultDto.h"

@implementation MTCItemSearchResultDto

+(instancetype) initWithId:(NSString*)id title:(NSString *) title price:(NSNumber*) price subtitle:(NSString*) subtitle  availableQuantity:(NSNumber*)quantity condition:(MTCConditiontTypeDto*)condition buyingMode:(MTCBuyingModeTypeDto*)buyingMode currency:(MTCCurrencyTypeDto*)currency thumbnail:(UIImage*) image
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
    [_subtitle release];
    [_availableQuantity release];
    [_tittle release];
    [_price release];
    [_thumbnail release];
    [super dealloc];
}

@end
