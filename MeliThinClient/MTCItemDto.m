//
//  MTCItemDto.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 10/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCItemDto.h"

@implementation MTCItemDto


- (void)dealloc
{
    [_id release];
    _id = nil;
    [_title release];
    _title = nil;
    [_subtitle release];
    _subtitle = nil;
    [_price release];
    _price = nil;
    [_availableQuantity release];
    _availableQuantity = nil;
    [_buyingMode release];
    _buyingMode = nil;
    [_condition release];
    _condition = nil;
    [_pictures release];
    _pictures = nil;
    [_descriptions release];
    _descriptions = nil;
    [_currency release];
    _currency = nil;
    [super dealloc];
}
@end
