//
//  MTCItemTranslator.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 10/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCItemTranslator.h"
#import "MTCItemDto.h"
#import "MTCConditionTranslator.h"
#import "MTCBuyingModeTranslator.h"

@interface MTCItemTranslator ()

@property (nonatomic,retain) MTCPicturesJsonTranslator * picturesTranslator;
@property (retain,nonatomic) MTCConditionTranslator * conditionJsonTranslator;
@property (retain,nonatomic) MTCBuyingModeTranslator * buyingModeJsonTranslator;

@end

@implementation MTCItemTranslator

- (instancetype)init
{
    self = [super init];
    if (self) {
        _picturesTranslator = [[MTCPicturesJsonTranslator alloc] init];
        _conditionJsonTranslator = [[MTCConditionTranslator alloc] init];
        _buyingModeJsonTranslator = [[MTCBuyingModeTranslator alloc] init];
    }
    return self;
}

- (NSObject*) objectFromDictionaryWithJson:(NSDictionary *)json
{
    MTCItemDto * item = [[[MTCItemDto alloc] init] autorelease];
    item.identifier = json[@"id"];
    item.title = [json objectForKey:@"title"];
    item.subtitle = [json objectForKey:@"subtitle"];
    item.price = [json objectForKey:@"price"];
    item.availableQuantity = [json objectForKey:@"available_quantity"];
    
    item.condition = (MTCConditiontTypeDto *)[self.conditionJsonTranslator objectFromDictionaryWithJson:json];
    item.buyingMode = (MTCBuyingModeTypeDto *)[self.buyingModeJsonTranslator objectFromDictionaryWithJson:json];
    
    item.pictures = [self.picturesTranslator arrayFromDictionaryWithJson:json];
    item.descriptions = json[@"descriptions"];
    return item;
}

- (void)dealloc
{
    [_buyingModeJsonTranslator release];
    _buyingModeJsonTranslator = nil;
    [_conditionJsonTranslator release];
    _conditionJsonTranslator = nil;
    [_picturesTranslator release];
    _picturesTranslator =  nil;
    [super dealloc];
}
@end
