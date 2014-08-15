//
//  MTCPagerJsonTranslator.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 10/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCPagerJsonTranslator.h"
#import "MTCPagerList.h"

@implementation MTCPagerJsonTranslator

- (NSObject *) objectFromDictionaryWithJson:(NSDictionary *)json    {
    NSDictionary * paging = json[@"paging"];
    MTCPagerList * pager = [[[MTCPagerList alloc] init] autorelease];
    pager.total = [paging[@"total"] intValue];
    pager.offset = [paging[@"offset"] intValue];
    pager.limit = [paging[@"limit"] intValue];
    return pager;
}
@end
