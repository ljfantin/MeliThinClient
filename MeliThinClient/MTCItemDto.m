//
//  MTCItemDto.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCItemDto.h"

@implementation MTCItemDto

+(instancetype) initWithTitle:(NSString *) tittle price:(NSString*) price thumbnail:(UIImage*) image
{
    MTCItemDto * item = [[[MTCItemDto alloc] init] autorelease];
    item.tittle = tittle;
    item.price = price;
    item.thumbnail = image;
    return item;
}

@end
