//
//  MTCMeliSearchService.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 25/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCMeliServiceApi.h"
#import "MTCPagerList.h"
#import "MTCMeliServiceApiItemDelegate.h"

@interface MTCMeliServiceApiSearch : MTCMeliServiceApi

@property (nonatomic, copy) NSString *path;
@property (nonatomic, assign) id <MTCMeliServiceApiItemDelegate> delegate;

- (void)searchWithQuery:(NSString *)query withPager:(MTCPagerList *)pager;

@end
