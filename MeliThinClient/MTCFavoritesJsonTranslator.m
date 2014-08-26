//
//  MTCFavoritesJsonTranslator.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 12/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCFavoritesJsonTranslator.h"

@implementation MTCFavoritesJsonTranslator

- (instancetype)init {
	self = [super init];
	if (self) {
		_resultJsonTranslator = [[MTCSearchResultJsonTranslator alloc] init];
	}
	return self;
}

- (NSArray *)arrayFromDictionaryWithJson:(NSDictionary *)json {
	NSMutableArray *listItems = [NSMutableArray array];
	for (NSDictionary *item in json) {
		//agrego el item
		[listItems addObject:[self.resultJsonTranslator objectFromDictionaryWithJson:item]];
	}
	return listItems;
}

@end
