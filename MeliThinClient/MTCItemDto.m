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
    [_title release];
    [_subtitle release];
    [_price release];
    [_availableQuantity release];
    [_buyingMode release];
    [_condition release];
    [_pictures release];
    [_descriptions release];
    [super dealloc];
}
@end
