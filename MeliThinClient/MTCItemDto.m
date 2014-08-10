//
//  MTCItemDto.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCItemDto.h"

@implementation MTCItemDto

+(instancetype) initWithId:(NSString*)id title:(NSString *) title price:(NSNumber*) price subtitle:(NSString*) subtitle  availableQuantity:(NSNumber*)quantity condition:(MTCConditiontTypeDto*)condition buyingMode:(MTCBuyingModeTypeDto*)buyingMode thumbnail:(UIImage*) image
{
    
    MTCItemDto * item = [[[MTCItemDto alloc] init] autorelease];
    //TODO VER ESTO
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
