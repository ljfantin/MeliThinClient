//
//  MTCItemDto.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCItemDto.h"

@implementation MTCItemDto

+(instancetype) initWithTitle:(NSString *) tittle price:(NSNumber*) price subtitle:(NSString*) subtitle  availableQuantity:(NSNumber*)quantity condition:(NSString*)condition thumbnail:(UIImage*) image    {
    
    MTCItemDto * item = [[[MTCItemDto alloc] init] autorelease];
    if (tittle!=nil && ![tittle isEqual:[NSNull null]]) {
        item.tittle = tittle;
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
    if (condition!=nil && ![condition isEqual:[NSNull null]]) {
        item.condition = condition;
    }
    if (image!=nil && ![image isEqual:[NSNull null]]) {
        item.thumbnail = image;
    }
    return item;
}

- (void)dealloc
{
    [_tittle release];
    [_price release];
    [_thumbnail release];
    [super dealloc];
}

@end
