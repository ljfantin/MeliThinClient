//
//  MTCSearchJsonTranslator.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 08/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCSearchJsonTranslator.h"
#import "MTCItemSearchResultDto.h"


@implementation MTCSearchJsonTranslator

- (instancetype)init
{
    self = [super init];
    if (self) {
        _resultJsonTranslator = [[MTCSearchResultJsonTranslator alloc] init];
    }
    return self;
}

- (NSArray *) arrayFromDictionaryWithJson:(NSDictionary *)json
{
    NSArray * jsonResults = json[@"results"];
    NSMutableArray * listItems = [NSMutableArray array];
    for (NSDictionary * item in jsonResults) {
        //agrego el item
        [listItems addObject:[self.resultJsonTranslator objectFromDictionaryWithJson:item]];
    }    
    return listItems;
}

- (void)dealloc
{
    [_resultJsonTranslator release];
    _resultJsonTranslator = nil;
    [super dealloc];
}



@end
