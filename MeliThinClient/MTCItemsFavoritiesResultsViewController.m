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
#import "MTCFavoriteManager.h"

@interface MTCItemsFavoritiesResultsViewController ()

@end

@implementation MTCItemsFavoritiesResultsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		//_service = [[MTCMeliServiceApiImpl alloc] init];
		_favoritesJsonTranslator = [[MTCFavoritesJsonTranslator alloc] init];
		//Titulo utilizado para tab bar
		self.title = @"Favoritos";
		[self.service setDelegate:self];
	}
	return self;
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self requestNewItems];
}

- (void)requestNewItems {
	MTCFavoriteManager *manager = [MTCFavoriteManager sharedInstance];
	NSArray *idFavorites = [manager arrayWithObjectsWithId];
	if (idFavorites != nil && [idFavorites count] > 0) {
		self.labelMessageFavorites.hidden = YES;
		[self.spinner startAnimating];
		[self.service getAllBookmarks:nil];
	}
	else {
		self.labelMessageFavorites.text = NSLocalizedString(@"view.message.sinfavoritos", nil);
		self.labelMessageFavorites.hidden = NO;
	}
}

#pragma mark Implementacion delegate MTCServiceApiDelegate
- (void)onPostExecute:(NSDictionary *)data;
{
	[super onPostExecute:data];
	NSArray *listItems = [self.favoritesJsonTranslator arrayFromDictionaryWithJson:data];

	//actualizo el header de la tabla
	[self updateTitle:@"Favoritos" withCount:[listItems count]];

	[self.items removeAllObjects];
	[self.items addObjectsFromArray:listItems];
	[self.spinner stopAnimating];
	[self.tableView reloadData];
}




@end
