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
#import "UIImageView+AFNetworking.h"



#define NUMBER_OF_SECCCIONS 1;


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
    if (item.currency!=nil && item.price!=nil) {
        NSMutableString * price = [NSMutableString string];
        [price appendString:item.currency.symbol];
        [price appendString:[item.price stringValue]];
        cell.price.text = price;
    } else {
        cell.price.text = NSLocalizedString(@"sinprecio", nil);
    }
    
    NSURL *url = [NSURL URLWithString:item.urlThumbnail];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIImage *placeholderImage = [UIImage imageNamed:@"placeholder"];
    __block UITableViewCell *weakCell = cell;
    [cell.imageView setImageWithURLRequest:request
                          placeholderImage:placeholderImage
                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                       weakCell.imageView.image = image;
                                       [weakCell setNeedsLayout];
                                       
                                   } failure:nil];

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
    itemDto.identifier = itemSearchDto.identifier;
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
    //oculta tabbar
    vipItemViewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vipItemViewController animated:YES];
}


- (void)dealloc
{
    [_pager release];
    _pager = nil;
    [_items release];
    _items = nil;
    [_titleHeaderTable release];
    _titleHeaderTable = nil;
    _tableView.delegate = nil;
    _tableView.dataSource = nil;
    [_tableView release];
    _tableView = nil;
    [_spinner release];
    _spinner = nil;
    [super dealloc];
}


@end
