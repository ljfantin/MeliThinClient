//
//  MTCMeliSearchService.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 25/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCMeliServiceApiImpl.h"
#import "MTCPagerList.h"
#import "MTCMeliServiceApiItemDelegate.h"

@interface MTCMeliSearchService : MTCMeliServiceApiImpl

@property (nonatomic, copy) NSString *path;
@property (nonatomic, assign) id <MTCMeliServiceApiItemDelegate> delegate;

- (void)search:(NSString *)query pager:(MTCPagerList *)pager;

@end
