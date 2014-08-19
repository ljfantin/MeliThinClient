//
//  MTCSearchResultsViewController.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>

#import "MTCItemsSearchResultsViewController.h"
#import "MTCMeliServiceApiImpl.h"
#import "MTCPagerList.h"
#import "MTCItemSearchResultDto.h"
#import "MTCSearchHistoryDto.h"
#import "AFNetworkReachabilityManager.h"
#import "UIAlertView+MTCMessage.h"


@interface MTCItemsSearchResultsViewController ()
@end

@implementation MTCItemsSearchResultsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.service = [[[MTCMeliServiceApiImpl alloc] init] autorelease];
        [self.service setDelegate:self];
        _searchJsonTranslator = [[MTCSearchJsonTranslator alloc] init];
        _pagerJsonTranslator = [[MTCPagerJsonTranslator alloc] init];
        _searchHistoryDao = [[MTCSearchHistoryManager alloc] init];
        _queryHistorial = [_searchHistoryDao arrayWithObjects];
        //Titulo utilizado para tab bar
        self.title = @"Buscar";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.searchBar.text = self.searchQuery;
    // TODO __block ? agrego el infinito scrolling
    __block typeof(self) weakSelf = self;
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        [weakSelf addNewItemsToTableView];
    }];
    
    [self requestNewItems];
}


- (void) addNewItemsToTableView{
    if (self.pager.offset+self.pager.limit*2 <= self.pager.total)  {
        self.pager.offset += self.pager.limit;
        [self requestNewItems];
    }
}


- (void) requestNewItems
{
    [self.service search:self.searchQuery pager:self.pager];
}

#pragma mark UISearchBarDelegate implementation
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    self.searchQuery = searchBar.text;
    [self.pager resetToValuesDefault];
    [self.items removeAllObjects];
    [self requestNewItems];
    [searchBar resignFirstResponder];
    MTCSearchHistoryManager * searchHistoryManager = [MTCSearchHistoryManager sharedInstance];
    [searchHistoryManager saveSearchHistory:[MTCSearchHistoryDto mtcSearchHistoryDtoWithQuery:self.searchQuery]];
    [searchHistoryManager commit];
}


- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    searchBar.text = self.searchQuery;
}



#pragma mark Implementacion delegate MTCServiceApiDelegate
- (void) onPostExecute:(NSDictionary *) data;
{
    [super onPostExecute:data];
    NSArray * listItems = [self.searchJsonTranslator arrayFromDictionaryWithJson:data];
    self.pager = (MTCPagerList*)[self.pagerJsonTranslator objectFromDictionaryWithJson:data];
    
    //updeteo el title de la tabla
    [self updateTitle:self.searchQuery withCount:self.pager.total];
    
    //Si no tengo data cargada hago un reload
    NSInteger startingRow = self.pager.offset;
    if ([self.items count]==0)   {
        [self.items addObjectsFromArray:listItems];
        [self.tableView reloadData];
    }
    else
    {
        //Caso contrario agrego los datos al final de la tabla
        NSMutableArray *indexPaths = [NSMutableArray array];
        for (MTCItemSearchResultDto *item in listItems) {
            [self.items addObject:item];
            [indexPaths addObject:[NSIndexPath indexPathForRow:startingRow inSection:0]];
            startingRow++;
        }
        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
        //stop el pull
        [self.tableView.pullToRefreshView stopAnimating];
        [self.tableView.infiniteScrollingView stopAnimating];
    }
}


- (void)dealloc
{
    [_pagerJsonTranslator release];
    _pagerJsonTranslator = nil;
    _searchBar.delegate = nil;
    [_searchBar release];
    _searchBar = nil;
    [_searchQuery release];
    _searchQuery = nil;
    [_service release];
    _service = nil;
    [_queryHistorial release];
    _queryHistorial = nil;
    [_searchHistoryDao release];
    _searchHistoryDao = nil;
    [super dealloc];
}
@end
