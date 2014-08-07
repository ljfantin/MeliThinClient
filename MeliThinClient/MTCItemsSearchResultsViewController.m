//
//  MTCSearchResultsViewController.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCItemsSearchResultsViewController.h"
#import "MTCMeliServiceApiImpl.h"

@interface MTCItemsSearchResultsViewController ()

@end

@implementation MTCItemsSearchResultsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.service = [[[MTCMeliServiceApiImpl alloc] init] autorelease];
        [self.service setDelegate:self];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.service search:self.searchQuery];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) onPostExecute:(NSArray *) data;
{
    [self setValues:data];
    self.pager.countPages = 10;
    self.pager.numberPage = 1;
    [self.tableView reloadData];
}




@end
