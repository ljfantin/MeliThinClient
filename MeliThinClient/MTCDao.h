//
//  MTCDao.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MTCDao <NSObject>

- (id) load:(NSString*)id;
- (BOOL) save:(id)object;
- (NSEnumerator*) findAll;


/*
- (void) saveItemSearchResult:(MTCItemSearchResultDto*)dto;
- (void) saveItemVip:(MTCItemDto*)dto;

- (void) saveItemSearchResult:(MTCItemSearchResultDto*)dto;
- (void) loadItemVip:(MTCItemDto*)dto;
*/

 
 @end
