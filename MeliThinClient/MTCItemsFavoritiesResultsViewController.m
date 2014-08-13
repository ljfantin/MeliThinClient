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

- (void) requestNewItems
{
    [self.service getAllBookmarks:nil];
}


#pragma mark Implementacion delegate MTCServiceApiDelegate
- (void) onPostExecute:(NSDictionary *) data;
{
    NSArray * listItems = [self.favoritesJsonTranslator translate:data];

    //stop el spinner
    [self.spinner stopAnimating];
    
    //actualizo el header de la tabla
    [self updateTitle:@"Favoritos" withCount:[listItems count]];
    
    //if ([self.items count]==0)   {
    [self.items removeAllObjects];
    [self.items addObjectsFromArray:listItems];
    [self.tableView reloadData];
    //}
    /*else {
        NSMutableArray *indexPaths = [NSMutableArray array];
        for (MTCItemSearchResultDto *item in listItems) {
            [self.items addObject:item];
            [indexPaths addObject:[NSIndexPath indexPathForRow:startingRow inSection:0]];
            startingRow++;
        }
        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    }*/
}

- (void) onPreExecute
{
    [self.spinner startAnimating];
}

- (void)dealloc
{
    [_service release];
    [super dealloc];
}


@end
