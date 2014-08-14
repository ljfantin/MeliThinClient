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

- (NSObject*) translateObject:(NSDictionary *)json
{
    //mapeo json
    NSString * id = [json objectForKey:@"id"];
    NSString * title = [json objectForKey:@"title"];
    NSString * subtitle = [json objectForKey:@"subtitle"];
    NSNumber * price = [json objectForKey:@"price"];
    NSNumber * quantity = [json objectForKey:@"available_quantity"];
    NSString * currencyId = [json objectForKey:@"currency_id"];
    
    MTCConditiontTypeDto * condition = (MTCConditiontTypeDto *)[self.conditionJsonTranslator translateObject:json];
    MTCBuyingModeTypeDto * buyingMode = (MTCBuyingModeTypeDto *)[self.buyingModeJsonTranslator translateObject:json];
    MTCCurrencyTypeDto * currency = [MTCCurrencyTypeDto initWith:currencyId];
    
    NSString * urlThumbnail = [json objectForKey:@"thumbnail"];
    UIImage * image = [UIImage imageWithUrl:urlThumbnail];
    
    //creo el dto
    MTCItemSearchResultDto * item = [MTCItemSearchResultDto initWithId:id title:title price:price subtitle:subtitle availableQuantity:quantity condition:condition buyingMode:buyingMode currency:currency thumbnail:image];
    return item;
}

-(void)dealloc{
    [_conditionJsonTranslator release];
    [_buyingModeJsonTranslator release];
    [super dealloc];
}

@end
