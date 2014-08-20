//
//  MTCSearchResultsJsonTranslator.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 12/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCSearchResultJsonTranslator.h"
#import "MTCConditionTranslator.h"
#import "MTCBuyingModeTranslator.h"
#import "MTCConditiontTypeDto.h"
#import "MTCBuyingModeTypeDto.h"
#import "UIImage+Utils.h"
#import "MTCItemSearchResultDto.h"
#import "MTCCurrencyTypeDto.h"



@interface MTCSearchResultJsonTranslator ()

@property (retain,nonatomic) MTCConditionTranslator * conditionJsonTranslator;
@property (retain,nonatomic) MTCBuyingModeTranslator * buyingModeJsonTranslator;

@end

@implementation MTCSearchResultJsonTranslator

- (instancetype)init
{
    self = [super init];
    if (self) {
        _conditionJsonTranslator = [[MTCConditionTranslator alloc] init];
        _buyingModeJsonTranslator = [[MTCBuyingModeTranslator alloc] init];
    }
    return self;
}

- (NSObject*) objectFromDictionaryWithJson:(NSDictionary *)json
{
    //creo el dto
    MTCItemSearchResultDto * item = [[[MTCItemSearchResultDto alloc] init] autorelease];

    //mapeo json
    NSString * identifier = [json objectForKey:@"id"];
    if (identifier!=nil && ![identifier isEqual:[NSNull null]]) {
        item.identifier = identifier;
    }

    NSString * title = [json objectForKey:@"title"];
    if (title!=nil && ![title isEqual:[NSNull null]]) {
        item.tittle = title;
    }

    NSString * subtitle = [json objectForKey:@"subtitle"];
    if (subtitle!=nil && ![subtitle isEqual:[NSNull null]]) {
        item.subtitle = subtitle;
    }
    
    NSNumber * price = [json objectForKey:@"price"];
    if (price!=nil && ![price isEqual:[NSNull null]]) {
        item.price = price;
    }
    
    NSNumber * quantity = [json objectForKey:@"available_quantity"];
    if (quantity!=nil && ![quantity isEqual:[NSNull null]]) {
        item.availableQuantity = quantity;
    }
    
    NSString * currencyId = [json objectForKey:@"currency_id"];
    if (currencyId!=nil && ![currencyId isEqual:[NSNull null]]) {
        item.currency = [MTCCurrencyTypeDto mtcCurrencyTypeDtoWithIdentifier:currencyId];
    }
    
    MTCConditiontTypeDto * condition = (MTCConditiontTypeDto *)[self.conditionJsonTranslator objectFromDictionaryWithJson:json];
    if (condition!=nil) {
        item.condition = condition;
    }

    MTCBuyingModeTypeDto * buyingMode = (MTCBuyingModeTypeDto *)[self.buyingModeJsonTranslator objectFromDictionaryWithJson:json];
    if (buyingMode!=nil){
        item.buyingMode = buyingMode;
    }

    NSString * urlThumbnail = [json objectForKey:@"thumbnail"];
    if (urlThumbnail!=nil)  {
        item.urlThumbnail = urlThumbnail;
    }
    
    return item;
}

-(void)dealloc{
    [_conditionJsonTranslator release];
    _conditionJsonTranslator = nil;
    [_buyingModeJsonTranslator release];
    _buyingModeJsonTranslator = nil;
    [super dealloc];
}

@end
