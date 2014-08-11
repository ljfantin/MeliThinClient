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
#import "MTCConditionTranslator.h"
#import "MTCBuyingModeTranslator.h"


@interface MTCSearchJsonTranslator ()

@property (retain,nonatomic) MTCConditionTranslator * conditionJsonTranslator;
@property (retain,nonatomic) MTCBuyingModeTranslator * buyingModeJsonTranslator;

@end

@implementation MTCSearchJsonTranslator

- (instancetype)init
{
    self = [super init];
    if (self) {
        _conditionJsonTranslator = [[MTCConditionTranslator alloc] init];
        _buyingModeJsonTranslator = [[MTCBuyingModeTranslator alloc] init];
    }
    return self;
}

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
        MTCConditiontTypeDto * condition = (MTCConditiontTypeDto *)[self.conditionJsonTranslator translateObject:item];
        MTCBuyingModeTypeDto * buyingMode = (MTCBuyingModeTypeDto *)[self.buyingModeJsonTranslator translateObject:item];
        
        NSString * urlThumbnail = [item objectForKey:@"thumbnail"];
        UIImage * image = [UIImage imageWithUrl:urlThumbnail];
        
        //creo el dto
        MTCItemSearchResultDto * item = [MTCItemSearchResultDto initWithId:id title:title price:price subtitle:subtitle availableQuantity:quantity condition:condition buyingMode:buyingMode thumbnail:image];
        
        //agrego el item
        [listItems addObject:item];
    }
    
    return listItems;
}


-(void)dealloc{
    [_conditionJsonTranslator release];
    [_buyingModeJsonTranslator release];
    [super dealloc];
}

@end
