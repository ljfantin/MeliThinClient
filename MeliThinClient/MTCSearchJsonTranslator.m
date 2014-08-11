//
//  MTCSearchJsonTranslator.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 08/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCSearchJsonTranslator.h"
#import "MTCItemSearchResultDto.h"
#import "UIImage+Utils.h"
#import "MTCPagerJsonTranslator.h"

@interface MTCSearchJsonTranslator ()

@property (retain,nonatomic) MTCPagerJsonTranslator * pagerJsonTranslator;
@end

@implementation MTCSearchJsonTranslator

- (NSArray *) translate:(NSDictionary *)json
{
    NSArray * jsonResults = json[@"results"];
    NSMutableArray * listItems = [NSMutableArray array];
    for (NSDictionary * item in jsonResults) {
        //mapeo json
        NSString * id = [item objectForKey:@"id"];
        NSString * title = [item objectForKey:@"title"];
        NSString * subtitle = [item objectForKey:@"subtitle"];
        NSNumber * price = [item objectForKey:@"price"];
        NSNumber * quantity = [item objectForKey:@"available_quantity"];

        MTCConditiontTypeDto * condition = [self translateCondition:[item objectForKey:@"condition"]];
        MTCBuyingModeTypeDto * buyingMode = [self translateBuyingMode:[item objectForKey:@"buying_mode"]];

        NSString * urlThumbnail = [item objectForKey:@"thumbnail"];
        UIImage * image = [UIImage imageWithUrl:urlThumbnail];
        
        //creo el dto
        MTCItemSearchResultDto * item = [MTCItemSearchResultDto initWithId:id title:title price:price subtitle:subtitle availableQuantity:quantity condition:condition buyingMode:buyingMode thumbnail:image];
        
        //agrego el item
        [listItems addObject:item];
    }
    
    return listItems;
}

-(MTCConditiontTypeDto *) translateCondition:(NSString *) conditionJsonValue
{
    MTCConditiontTypeDto * condition = nil;
    if ([conditionJsonValue isEqual:@"new"])    {
        condition = [MTCConditiontTypeDto initWithNew];
    } else
    if ([conditionJsonValue isEqual:@"used"])    {
        condition = [MTCConditiontTypeDto initWithUsed];
    }else
    if ([conditionJsonValue isEqual:@"unespecified"])    {
        condition = [MTCConditiontTypeDto initWithUnespecified];
    }
    return condition;
}

-(MTCBuyingModeTypeDto *) translateBuyingMode:(NSString *) buyingModeJsonValue
{
    MTCBuyingModeTypeDto * buyingMode = nil;
    if ([buyingModeJsonValue isEqual:@"auction"])    {
        buyingMode = [MTCBuyingModeTypeDto initWithAuction];
    } else
    if ([buyingModeJsonValue isEqual:@"buy_it_now"])    {
        buyingMode = [MTCBuyingModeTypeDto initWithBuyItNow];
    }else
    if ([buyingModeJsonValue isEqual:@"classified"])    {
        buyingMode = [MTCBuyingModeTypeDto initWithClassified];
    }
    return buyingMode;
}

-(void)dealloc{
    [_pagerJsonTranslator release];
    [super dealloc];
}

@end
