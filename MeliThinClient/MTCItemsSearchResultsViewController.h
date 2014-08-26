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
#import "MTCMeliServiceApiImpl.h"
#import "MTCPagerList.h"
#import "MTCSearchJsonTranslator.h"
#import "MTCPagerJsonTranslator.h"
#import "MTCSearchHistoryManager.h"


@interface MTCItemsSearchResultsViewController : MTCAbtractListItemTableViewViewController <UISearchBarDelegate>

@property (nonatomic, strong) NSString *searchQuery;
@property (nonatomic, strong) MTCSearchJsonTranslator *searchJsonTranslator;
@property (nonatomic, strong) MTCPagerJsonTranslator *pagerJsonTranslator;
@property (nonatomic, strong) MTCMeliServiceApiImpl *service;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) NSArray *queryHistorial;
@property (nonatomic, strong) MTCSearchHistoryManager *searchHistoryDao;

@end
