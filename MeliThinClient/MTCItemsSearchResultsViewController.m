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

#import "UIScrollView+SVPullToRefresh.h"
#import "UIScrollView+SVInfiniteScrolling.h"
#import "MTCPagerList.h"
#import "MTCItemSearchResultDto.h"


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
        //Titulo utilizado para tab bar
        self.title = @"Buscar";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.service search:self.searchQuery pager:self.pager];
    
    // TODO __block ? agrego el infinito scrolling
    __block typeof(self) weakSelf = self;
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        [weakSelf addNewItemsToTableView];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) addNewItemsToTableView{
    if (self.pager.offset+self.pager.limit*2 <= self.pager.total)  {
        self.pager.offset += self.pager.limit;
        [self.service search:self.searchQuery pager:self.pager];
    }
}


#pragma mark Implementacion delegate MTCServiceApiDelegate

- (void) onPostExecute:(NSDictionary *) data;
{
    NSArray * listItems = [self.searchJsonTranslator translate:data];
    self.pager = (MTCPagerList*)[self.pagerJsonTranslator translateObject:data];
    
    //stop el spinner
    [self.spinner stopAnimating];
    
    //actualizo el header de la tabla
    NSMutableString * header = [NSMutableString stringWithString:self.searchQuery];
    [header appendString:@" ("];
    [header appendString:[@(self.pager.total) stringValue]];
    [header appendString:@")"];
    self.titleHeaderTable = header;
    
    //cargo los filas
    NSInteger startingRow = self.pager.offset;
    if ([self.items count]==0)   {
        [self.items addObjectsFromArray:listItems];
        [self.tableView reloadData];
    }
    else {
        NSMutableArray *indexPaths = [NSMutableArray array];
        for (MTCItemSearchResultDto *item in listItems) {
            [self.items addObject:item];
            [indexPaths addObject:[NSIndexPath indexPathForRow:startingRow inSection:0]];
            startingRow++;
        }
        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    }

    //stop el pull
    [self.tableView.pullToRefreshView stopAnimating];
    [self.tableView.infiniteScrollingView stopAnimating];
}

- (void) onPreExecute
{
    NSLog(@"onPreExecute");
    //[self.spinner startAnimating];
}


- (void)dealloc
{
    [_pagerJsonTranslator release];
    [_searchJsonTranslator release];
    [_searchQuery release];
    [_service release];
    [super dealloc];
}
@end
