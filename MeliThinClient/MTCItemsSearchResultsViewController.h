//
//  MTCSearchResultsViewController.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTCAbtractListItemTableViewViewController.h"
#import "MTCServiceApiDelegate.h"
#import "MTCMeliServiceApi.h"
#import "MTCPagerList.h"
#import "MTCSearchJsonTranslator.h"
#import "MTCPagerJsonTranslator.h"


@interface MTCItemsSearchResultsViewController : MTCAbtractListItemTableViewViewController<MTCServiceApiDelegate>

@property (nonatomic, retain) NSString * searchQuery;
@property (nonatomic, retain) id<MTCMeliServiceApi> service;
@property (nonatomic, retain) MTCSearchJsonTranslator * searchJsonTranslator;
@property (nonatomic, retain) MTCPagerJsonTranslator * pagerJsonTranslator;



@end
