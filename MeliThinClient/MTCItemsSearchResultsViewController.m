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

#pragma mark Implementacion delegate MTCServiceApiDelegate

- (void) onPostExecute:(NSArray *) data;
{
    //stop el spinner
    [self.spinner stopAnimating];
    //seteo los datos
    [self setValues:data];
    //paginador
    self.pager.countPages = ceil((double)[data count]/self.pager.longPage);
    self.pager.numberPage = 1;
    //header tabla
    NSMutableString * header = [NSMutableString stringWithString:self.searchQuery];
    NSString * cantidad = [NSString stringWithFormat:@"%d",[data count]];
    [header appendString:@" ("];
    [header appendString:cantidad];
    [header appendString:@")"];
    self.titleHeaderTable = header;
    //cargo los datos
    [self.tableView reloadData];
}

- (void) onPreExecute
{
    NSLog(@"onPreExecute");
    //[self.spinner startAnimating];
}

@end
