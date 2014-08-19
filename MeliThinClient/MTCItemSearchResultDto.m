//
//  MTCItemDto.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCItemSearchResultDto.h"

@implementation MTCItemSearchResultDto

+(instancetype) mtcItemSearchResultDtoWithIdentifier:(NSString*)identifier title:(NSString *) title price:(NSNumber*) price subtitle:(NSString*) subtitle  availableQuantity:(NSNumber*)quantity condition:(MTCConditiontTypeDto*)condition buyingMode:(MTCBuyingModeTypeDto*)buyingMode currency:(MTCCurrencyTypeDto*)currency urlThumbnail:(NSString*) urlThumbnail
{
    
    MTCItemSearchResultDto * item = [[[MTCItemSearchResultDto alloc] init] autorelease];
    item.identifier = identifier;
    item.tittle = title;
    item.price = price;
    item.subtitle = subtitle;
    item.availableQuantity = quantity;
    item.condition = condition;
    item.buyingMode = buyingMode;
    item.currency = currency;
    item.urlThumbnail = urlThumbnail;
    return item;
}

- (void)dealloc
{
    [_identifier release];
    _identifier = nil;
    [_tittle release];
    _tittle = nil;
    [_price release];
    _price = nil;
    [_subtitle release];
    _subtitle = nil;
    [_availableQuantity release];
    _availableQuantity = nil;
    [_urlThumbnail release];
    _urlThumbnail = nil;
    [_currency release];
    _currency = nil;
    [_buyingMode release];
    _buyingMode = nil;
    [_condition release];
    _condition = nil;
    [super dealloc];
}

@end
