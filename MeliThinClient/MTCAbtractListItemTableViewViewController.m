//
//  MTCAbtractListItemTableViewViewController.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCAbtractListItemTableViewViewController.h"
#import "MTCItemSearchResultDto.h"
#import "MTCUIListItemResultTableViewCell.h"
#import "MTCVipItemViewController.h"


#define NUMBER_OF_SECCCIONS 1;

@interface MTCAbtractListItemTableViewViewController ()

@end

@implementation MTCAbtractListItemTableViewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _pager = [[MTCPagerList alloc] init];
        _items = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.tableView.tableFooterView = [UIView new];
    //[self requestNewItems];
    //[self requestNewItems];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) requestNewItems
{
}

- (void) updateTitle:(NSString *)title withCount:(NSInteger)countResults{
    
    NSMutableString * header = [NSMutableString stringWithString:title];
    [header appendString:@" ("];
    [header appendString:[@(countResults) stringValue]];
    [header appendString:@")"];
    self.titleHeaderTable = header;
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return NUMBER_OF_SECCCIONS;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MTCUIListItemResultTableViewCell *cell = (MTCUIListItemResultTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"cellItemFromSearch"];
    
    if (cell == nil)
    {
        UINib * nib = [UINib nibWithNibName:@"MTCUIListItemResultTableViewCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:@"cellItemFromSearch"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellItemFromSearch"];
    }
    
    MTCItemSearchResultDto * item = [self.items objectAtIndex:indexPath.row];
    //SE PODRIA FORMATEAR EL NUMERO POR LOCALE
    cell.title.text = item.tittle;
    NSMutableString * price = [NSMutableString string];
    [price appendString:item.currency.symbol];
    [price appendString:[item.price stringValue]];
    cell.price.text = price;
    cell.thumbnail.image = item.thumbnail;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.titleHeaderTable;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MTCItemSearchResultDto * itemSearchDto = [self.items objectAtIndex:indexPath.row];
    //creo el controller
    MTCVipItemViewController * vipItemViewController = [[MTCVipItemViewController alloc] init];
    //Creo el item
    MTCItemDto * itemDto = [[MTCItemDto alloc] init];
    //Copio los valos que ya tengo
    itemDto.id = itemSearchDto.id;
    itemDto.title = itemSearchDto.tittle;
    itemDto.subtitle = itemSearchDto.subtitle;
    itemDto.price = itemSearchDto.price;
    itemDto.availableQuantity = itemSearchDto.availableQuantity;
    itemDto.buyingMode = itemSearchDto.buyingMode;
    itemDto.condition = itemSearchDto.condition;
    itemDto.currency = itemSearchDto.currency;
    //seteo la busqueda
    vipItemViewController.item = itemDto;
    //pusheo el controller
    
    vipItemViewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vipItemViewController animated:YES];
}


- (void)dealloc {
    [_tableView release];
    [_spinner release];
    [_pager release];
    [super dealloc];
}


@end
