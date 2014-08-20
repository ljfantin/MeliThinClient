//
//  MTCSearchWithHistorialSearchViewController.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 14/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCSearchWithHistorialSearchViewController.h"
#import "MTCSearchHistoryDto.h"
#import "MTCItemsSearchResultsViewController.h"
#import "NSDateFormatter+MTCDateFormatter.h"

@implementation MTCSearchWithHistorialSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"history.title", nil);
        _listHistorial = [[NSArray alloc] init];
        _listHistorialFiltered = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [self.searchBar sizeToFit];
    self.historialTableView.tableFooterView = [[UIView alloc] init];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    MTCSearchHistoryManager * searchHistoryManager = [MTCSearchHistoryManager sharedInstance];
    self.listHistorial = [searchHistoryManager arrayWithObjects];
    [self.listHistorialFiltered removeAllObjects];
    _isFiltered = NO;
    if (self.listHistorial!=nil && [self.listHistorial count]>0)    {
        self.imageLogo.hidden = YES;
        //[self.historialTableView reloadData];
        [self.historialTableView reloadData];
    } else  {
        self.imageLogo.hidden = NO;
    }
}

#pragma mark UITableViewDataSource delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.isFiltered) {
        return[self.listHistorialFiltered count];
    } else {
        return[self.listHistorial count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"queryCell"];
    if ( cell == nil ) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1  reuseIdentifier:@"queryCell"] autorelease];
    }
    MTCSearchHistoryDto * searchHistoryDto = nil;
    if (self.isFiltered) {
        searchHistoryDto = self.listHistorialFiltered[indexPath.row];
    } else {
        searchHistoryDto = self.listHistorial[indexPath.row];
    }
    cell.textLabel.text = searchHistoryDto.query;
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    cell.detailTextLabel.text = [formatter stringFromDateWithMTCFormat:searchHistoryDto.date];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (self.listHistorial!=nil && [self.listHistorial count]>0)    {

        return NSLocalizedString(@"history.TableView.title", nil);
    } else  {
        return nil;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MTCSearchHistoryDto * searchHistoryDto;
    if (self.isFiltered) {
        searchHistoryDto = self.listHistorialFiltered[indexPath.row];
    } else {
        searchHistoryDto = self.listHistorial[indexPath.row];
    }
    NSString * query = searchHistoryDto.query;
    [self search:query];
}


#pragma mark UISearchBarDelegate implementation
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    [self search:self.searchBar.text];
}

-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)text
{
    if(text.length == 0)
    {
        self.isFiltered = FALSE;
    }
    else
    {
        self.isFiltered = true;
        self.listHistorialFiltered = [[[NSMutableArray alloc] init] autorelease];
        
        for (MTCSearchHistoryDto * searchHistoryDto in self.listHistorial)
        {
            NSRange queryRange = [searchHistoryDto.query rangeOfString:text options:NSCaseInsensitiveSearch];
            if(queryRange.location != NSNotFound)
            {
                [self.listHistorialFiltered addObject:searchHistoryDto];
            }
        }
    }
    
    [self.historialTableView reloadData];
}


- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}


- (void)search:(NSString*)query
{
    // called when keyboard search button pressed
    MTCItemsSearchResultsViewController * itemsSearchResult = [[MTCItemsSearchResultsViewController alloc] init];
    itemsSearchResult.searchQuery = query;
    
    MTCSearchHistoryManager * searchHistoryDao = [MTCSearchHistoryManager sharedInstance];
    [searchHistoryDao saveSearchHistory:[MTCSearchHistoryDto mtcSearchHistoryDtoWithQuery:query]];
    [searchHistoryDao commit];
    
    [self.navigationController pushViewController:itemsSearchResult animated:YES];
    [itemsSearchResult release];
}

- (void)dealloc
{
    _historialTableView.delegate = nil;
    _historialTableView.dataSource = nil;
    [_historialTableView release];
    _historialTableView = nil;
    [_searchBar release];
    _searchBar = nil;
    [_spinner release];
    _spinner = nil;
    [_listHistorial release];
    _listHistorial = nil;
    [_listHistorialFiltered release];
    _listHistorialFiltered = nil;
    [_imageLogo release];
    [super dealloc];
}
@end
