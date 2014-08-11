//
//  MTCItemTranslator.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 10/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCItemTranslator.h"
#import "MTCItemDto.H"

@implementation MTCItemTranslator

- (NSObject*) translateObject:(NSDictionary *)json
{
    NSArray * pictures = [self.picturesTranslator translate:json];
    NSArray * descriptions = json[@"descriptions"];
    NSString * id = json[@"id"];
    MTCItemDto * item = [[MTCItemDto alloc] init];
    item.pictures = pictures;
    item.descriptions = descriptions;
    item.id = id;
    return item;
}

- (void)dealloc
{
    [_picturesTranslator release];
    [super dealloc];
}
@end
