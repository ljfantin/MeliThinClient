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
        [self buildQueryHistorial];
        //Titulo utilizado para tab bar
        self.title = @"Buscar";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //creo search bar
    [self buildSearchBar];

    // TODO __block ? agrego el infinito scrolling
    __block typeof(self) weakSelf = self;
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        [weakSelf addNewItemsToTableView];
    }];
}


- (void) buildQueryHistorial
{
    _searchHistoryDao = [[MTCSearchHistoryDao alloc] init];
    _queryHistorial = [_searchHistoryDao getAll];
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


- (void) buildSearchBar
{
    _searchBar = [UISearchBar new];
    self.searchBar.showsCancelButton = YES;
    self.searchBar.delegate = self;
    [_searchBar sizeToFit];
    self.tableView.tableHeaderView = self.searchBar;

}

/*- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView != self.searchBarDisplayController.searchResultsTableView) {
        return [super tableView:tableView numberOfRowsInSection:section];
    } else {
        return [self.queryHistorial count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView != self.searchBarDisplayController.searchResultsTableView) {
        return [super tableView:tableView cellForRowAtIndexPath:indexPath];
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"queryCell"];
        if ( cell == nil ) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"queryCell"];
        }
        MTCSearchHistoryDto * dto = self.queryHistorial[indexPath.row];
        cell.textLabel.text = dto.query;
        return cell;
    }
}
*/

#pragma mark UISearchBarDelegate implementation
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;  {                    // called when keyboard search button pressed
    self.searchQuery = searchBar.text;
    [self.pager reset];
    [self.items removeAllObjects];
    [self requestNewItems];
    [searchBar resignFirstResponder];
}


- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar;  {                    // called when keyboard search button pressed
    [searchBar resignFirstResponder];
    searchBar.text = self.searchQuery;
    
}



#pragma mark Implementacion delegate MTCServiceApiDelegate
- (void) onPostExecute:(NSDictionary *) data;
{
    NSArray * listItems = [self.searchJsonTranslator translate:data];
    self.pager = (MTCPagerList*)[self.pagerJsonTranslator translateObject:data];
    
    //stop el spinner
    [self.spinner stopAnimating];
    
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

- (void) onPreExecute
{
    [self.spinner startAnimating];
}


- (void)dealloc
{
    [_pagerJsonTranslator release];
    [_searchJsonTranslator release];
    [_searchQuery release];
    [_service release];
    [_queryHistorial release];
    [_searchHistoryDao release];
    [super dealloc];
}
@end
