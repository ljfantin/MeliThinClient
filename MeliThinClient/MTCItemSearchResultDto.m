//
//  MTCItemDto.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCItemSearchResultDto.h"

@implementation MTCItemSearchResultDto

+ (instancetype)mtcItemSearchResultDtoWithIdentifier:(NSString *)identifier title:(NSString *)title price:(NSNumber *)price subtitle:(NSString *)subtitle availableQuantity:(NSNumber *)quantity condition:(MTCConditiontTypeDto *)condition buyingMode:(MTCBuyingModeTypeDto *)buyingMode currency:(MTCCurrencyTypeDto *)currency urlThumbnail:(NSString *)urlThumbnail {
	MTCItemSearchResultDto *item = [[MTCItemSearchResultDto alloc] init];
	item.identifier = identifier;
	item.tittle = title;
	item.price = price;
	item.subtitle = subtitle;
	item.availableQuantity = quantity;
	item.condition = condition;
	item.buyingMode = buyingMode;
	item.currency = currency;
	item.urlThumbnail = urlThumbnail;
	return item;
}

@end
