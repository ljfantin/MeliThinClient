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

@implementation MTCSearchWithHistorialSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"history.title", nil);
    }
    return self;
}

- (void)viewDidLoad
{
    [self.searchBar sizeToFit];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    MTCSearchHistoryDao * searchHistoryDao = [MTCSearchHistoryDao sharedInstance];
    self.listHistorial = searchHistoryDao.getAll;
    [self.historialTableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return[self.listHistorial count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"queryCell"];
    if ( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1  reuseIdentifier:@"queryCell"];
    }
    MTCSearchHistoryDto * dto = self.listHistorial[indexPath.row];
    cell.textLabel.text = dto.query;
    cell.detailTextLabel.text = dto.date;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return NSLocalizedString(@"history.TableView.title", nil);
}

#pragma mark UISearchBarDelegate implementation
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;  {

    [searchBar resignFirstResponder];
    [self search:self.searchBar.text];
}


- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar;  {
    // called when keyboard search button pressed
    [searchBar resignFirstResponder];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MTCSearchHistoryDto * dto = self.listHistorial[indexPath.row];
    NSString * query = dto.query;
    [self search:query];
}

- (void)search:(NSString*)query
{
    // called when keyboard search button pressed
    MTCItemsSearchResultsViewController * itemsSearchResult = [[MTCItemsSearchResultsViewController alloc] init];
    itemsSearchResult.searchQuery = query;
    
    MTCSearchHistoryDao * searchHistoryDao = [MTCSearchHistoryDao sharedInstance];
    [searchHistoryDao save:[MTCSearchHistoryDto initWith:query]];
    [searchHistoryDao commit];
    
    [self.navigationController pushViewController:itemsSearchResult animated:YES];
    [itemsSearchResult release];
}

- (void)dealloc {
    [_historialTableView release];
    [_searchBar release];
    [_spinner release];
    [super dealloc];
}
@end
