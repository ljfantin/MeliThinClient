//
//  MTCBuyingModeTranslator.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 11/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCBuyingModeTranslator.h"
#import "MTCBuyingModeTypeDto.h"

@implementation MTCBuyingModeTranslator

- (NSObject *) objectFromDictionaryWithJson:(NSDictionary *)json
{
    NSString * buyingModeJsonValue = json[@"buying_mode"];
    MTCBuyingModeTypeDto * buyingMode = nil;
    if ([buyingModeJsonValue isEqual:@"auction"])   {
        buyingMode = [MTCBuyingModeTypeDto mtcBuyingModeTypeDtoWithAuction];
    }
    else
    if ([buyingModeJsonValue isEqual:@"buy_it_now"])    {
        buyingMode = [MTCBuyingModeTypeDto mtcBuyingModeTypeDtoWithBuyItNow];
    }
    else
    if ([buyingModeJsonValue isEqual:@"classified"])
    {
        buyingMode = [MTCBuyingModeTypeDto mtcBuyingModeTypeDtoWithClassified];
    }
    return buyingMode;
}

@end
