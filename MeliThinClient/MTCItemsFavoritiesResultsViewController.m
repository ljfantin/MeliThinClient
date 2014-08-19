//
//  MTCFavoritiesItemsResultsViewController.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCItemsFavoritiesResultsViewController.h"
#import "MTCMeliServiceApiImpl+SecureMethods.h"
#import "MTCItemSearchResultDto.h"
#import "AFNetworkReachabilityManager.h"
#import "UIAlertView+MTCMessage.h"

@interface MTCItemsFavoritiesResultsViewController ()

@end

@implementation MTCItemsFavoritiesResultsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _service = [[MTCMeliServiceApiImpl alloc] init];
        _favoritesJsonTranslator = [[MTCFavoritesJsonTranslator alloc] init];
        //Titulo utilizado para tab bar
        self.title = @"Favoritos";
        [self.service setDelegate:self];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    
    [self requestNewItems];
}

- (void)requestNewItems
{
    //if ([[AFNetworkReachabilityManager sharedManager] isReachable]) {
        [self.service getAllBookmarks:nil];
    /*} else {
        UIAlertView * alert = [UIAlertView alertViewWithErrorConectionWithDelegate:self];
        [alert show];
    }*/
}


#pragma mark Implementacion delegate MTCServiceApiDelegate
- (void)onPostExecute:(NSDictionary *)data;
{
    [super onPostExecute:data];
    NSArray * listItems = [self.favoritesJsonTranslator arrayFromDictionaryWithJson:data];
    
    //actualizo el header de la tabla
    [self updateTitle:@"Favoritos" withCount:[listItems count]];
    
    [self.items removeAllObjects];
    [self.items addObjectsFromArray:listItems];
    [self.tableView reloadData];
}


- (void)dealloc
{
    [_service release];
    _service = nil;
    [_favoritesJsonTranslator release];
    _favoritesJsonTranslator = nil;
    [super dealloc];
}


@end
