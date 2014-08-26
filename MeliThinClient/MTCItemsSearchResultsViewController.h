//
//  MTCSearchResultsViewController.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTCAbtractListItemTableViewViewController.h"
#import "MTCMeliServiceApi.h"
#import "MTCPagerList.h"
#import "MTCSearchJsonTranslator.h"
#import "MTCPagerJsonTranslator.h"
#import "MTCSearchHistoryManager.h"


@interface MTCItemsSearchResultsViewController : MTCAbtractListItemTableViewViewController<UISearchBarDelegate>

@property (nonatomic, retain) NSString * searchQuery;
@property (nonatomic, retain) MTCSearchJsonTranslator * searchJsonTranslator;
@property (nonatomic, retain) MTCPagerJsonTranslator * pagerJsonTranslator;
@property (nonatomic, retain) MTCMeliServiceApi * service;
@property (retain, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, retain) NSArray * queryHistorial;
@property (nonatomic, retain) MTCSearchHistoryManager * searchHistoryDao;

@end
