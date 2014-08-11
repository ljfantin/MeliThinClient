//
//  MTCDao.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MTCDao <NSObject>

- (NSString*)cacheDirectoryName;

- (void)cacheImage:(UIImage *)image inLocation:(NSString *)location
(NSString*)cacheDirectoryName;

/*
- (void) saveItemSearchResult:(MTCItemSearchResultDto*)dto;
- (void) saveItemVip:(MTCItemDto*)dto;

- (void) saveItemSearchResult:(MTCItemSearchResultDto*)dto;
- (void) loadItemVip:(MTCItemDto*)dto;
*/

 
 @end
