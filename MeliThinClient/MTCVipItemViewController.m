//
//  MTCVipItemViewController.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 08/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCVipItemViewController.h"
#import "MTCVipItemPhotoGalleryView.h"
#import "MTCMeliServiceApiImpl.h"
#import "MTCPictureDto.h"
#import "MTCPriceFavoriteButtonVipItemViewItemTableViewCell.h"
#import "MTCVipItemTableViewFooter.h"
#import "MTCItemDto.h"
#import "MTCDescriptionVipItemViewController.h"

#define INDEX_PRICE_FAVORITE_CELL 0
#define INDEX_SUBTITLE_CELL 1
#define INDEX_CONDITION_CELL 2
#define INDEX_AVAILABLE_CELL 3
#define INDEX_DESCRIPCION_CELL 4
// #define INDEX_BUY_BUTTON_CELL 5



@interface MTCVipItemViewController ()

@property MTCVipItemPhotoGalleryView * gallery;
@property MTCVipItemTableViewFooter * footer;
@property NSMutableArray * cells;
@property NSInteger cellsCount;

@end

@implementation MTCVipItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _service = [[MTCMeliServiceApiImpl alloc] init];
        [_service setDelegate:self];
        _itemTranslator = [[MTCItemTranslator alloc]init];
        _picturesTranslator = [[MTCPicturesJsonTranslator alloc] init];
        _cells = [[NSMutableArray alloc] init];
        _cellsCount = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _gallery= [[[NSBundle mainBundle] loadNibNamed:@"MTCVipItemPhotoGalleryView" owner:self options:nil] firstObject];
    
    _footer= [[[NSBundle mainBundle] loadNibNamed:@"MTCVipItemTableViewFooter" owner:self options:nil] firstObject];

    [self.service getItem:self.item.id attributes:@[@"pictures",@"descriptions"]];
    if (self.item.price!=nil)  {
        self.cells[self.cellsCount] = [NSNumber numberWithInteger:INDEX_PRICE_FAVORITE_CELL];
        self.cellsCount++;
    }
    if (self.item.subtitle!=nil)  {
        self.cells[self.cellsCount] = [NSNumber numberWithInteger:INDEX_SUBTITLE_CELL];
        self.cellsCount++;
    }
    if (self.item.condition!=nil)  {
        self.cells[self.cellsCount] = [NSNumber numberWithInteger:INDEX_CONDITION_CELL];
        self.cellsCount++;
    }
    if (self.item.availableQuantity!=nil)  {
        self.cells[self.cellsCount] = [NSNumber numberWithInteger:INDEX_AVAILABLE_CELL];
        self.cellsCount++;
    }
    //TODO ver que hacemos con esto
    self.cells[self.cellsCount] = [NSNumber numberWithInteger:INDEX_DESCRIPCION_CELL];
    self.cellsCount++;
    /*if (self.item.!=nil) {
        self.cells[self.cellsCount] = INDEX_DESCRIPCION_CELL;
        self.cellsCount++;
    }*/
    //EL BOTON VA SI O SI
    //self.cells[self.cellsCount] = [NSNumber numberWithInteger:INDEX_BUY_BUTTON_CELL];
    //self.cellsCount++;
    /*if (self.item.!=nil) {
     self.cells[self.cellsCount] = INDEX_DESCRIPCION_CELL;
     self.cellsCount++;
     }*/
    
    self.detailItemTableview.tableHeaderView = _gallery;
    self.detailItemTableview.tableFooterView = _footer;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Implementacion de UITableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _cellsCount;
}

/*- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return _footer;
}*/


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    NSNumber * cellId =  self.cells[indexPath.row];
    switch ([cellId intValue]) {
        case INDEX_PRICE_FAVORITE_CELL:
            cell = [self buildPriceFavoriteCell:tableView];
            break;
        case INDEX_SUBTITLE_CELL:
            cell = [self buildSubtitleCell:tableView];
            break;
        case INDEX_CONDITION_CELL:
            cell = [self buildConditionCell:tableView];
            break;
        case INDEX_AVAILABLE_CELL:
            cell = [self buildAvailableCell:tableView];
            break;
        case INDEX_DESCRIPCION_CELL:
            cell = [self buildDescriptionCell:tableView];
            break;
        /*case INDEX_BUY_BUTTON_CELL:
            cell = [self buildBuyButtonCell:tableView];
            break;*/
        default:
            break;
    }
    
    return cell;
}

- (UITableViewCell*) buildPriceFavoriteCell:(UITableView *)tableView
{
    static NSString *idPriceFavoriteCell = @"idPriceFavoriteCell";

    MTCPriceFavoriteButtonVipItemViewItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idPriceFavoriteCell];
    if (cell == nil)
    {
        cell = [[[MTCPriceFavoriteButtonVipItemViewItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idPriceFavoriteCell] autorelease];
    }
    NSMutableString * price = [NSMutableString string];
    [price appendString:@"$ "];
    [price appendString:[self.item.price stringValue]];
    cell.labelPrice.text = price;
    return cell;
}

- (UITableViewCell*) buildSubtitleCell:(UITableView *)tableView
{
    static NSString *idSubtitleCell = @"idSubtitleCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idSubtitleCell];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idSubtitleCell] autorelease];
    }
    cell.textLabel.text = self.item.subtitle;
    //Ver esto
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    cell.textLabel.numberOfLines = 12;
     return cell;
}

- (UITableViewCell*) buildConditionCell:(UITableView *)tableView
{
    static NSString *idConditionCell = @"idConditionCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idConditionCell];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idConditionCell] autorelease];
    }
    
    if ([self.item.condition isNew]) {
        cell.textLabel.text = @"Articulo nuevo";
    }
    else
    if ([self.item.condition isUsed]) {
        cell.textLabel.text = @"Articulo usado";
    }
    if ([self.item.condition isUnespecified]) {
        cell.textLabel.text = @"Condicion no especificada";
    }
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    cell.textLabel.numberOfLines = 12;
    return cell;
}


- (UITableViewCell*) buildDescriptionCell:(UITableView *)tableView
{
    static NSString *idSubtitleCell = @"idDescriptionCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idSubtitleCell];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idSubtitleCell] autorelease];
    }
    cell.textLabel.text = @"Descripcion";
    //Ver esto
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    cell.textLabel.numberOfLines = 12;
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];

    return cell;
}


- (UITableViewCell*) buildAvailableCell:(UITableView *)tableView
{
    static NSString *idSubtitleCell = @"idAvailableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idSubtitleCell];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idSubtitleCell] autorelease];
    }
    NSMutableString * available = [NSMutableString string];
    [available appendString:@"Cantidad disponible: "];
    [available appendString:[self.item.availableQuantity stringValue]];
    
    cell.textLabel.text = available;
    //Ver esto
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    cell.textLabel.numberOfLines = 12;
    return cell;
}

- (UITableViewCell*) buildBuyButtonCell:(UITableView *)tableView
{
    static NSString *idButtonCell = @"idBuyButtonCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idButtonCell];
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MTCBuyButtonVipItemTableViewCell" owner:self options:nil] firstObject];
    }
    return cell;
}




#pragma mark - Implementacion de UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    CGFloat pageWidth = sender.frame.size.width;
    int page = floor((sender.contentOffset.x - pageWidth / 2 ) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}

- (void) onPostExecute:(NSDictionary *) data
{
    //NSLog(@"Respuesta json search %@: %@", query, responseObject);
    //TODO falta descriptions
    //Si hago un translate entero piso los datos que ya tengo de item
    //self.item = (MTCItemDto * ) [self.itemTranslator translateObject:data];
    self.item.pictures = [self.picturesTranslator translate:data];
    NSMutableArray * images = [[NSMutableArray alloc] init];
    for (MTCPictureDto * pictureDto in self.item.pictures) {
        [images addObject:pictureDto.image];
    }
    [self.gallery loadImages:images withTitle:self.item.title];
}

- (void) onPreExecute
{
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.cells[indexPath.row] intValue] == INDEX_DESCRIPCION_CELL) {
    
        MTCDescriptionVipItemViewController * descriptionViewController = [[MTCDescriptionVipItemViewController alloc] init];
        descriptionViewController.idItem = self.item.id;
        [self.navigationController pushViewController:descriptionViewController animated:YES];
    }
}

- (void)dealloc
{
    [_itemTranslator release];
    [_picturesTranslator release];
    [_gallery release];
    [_pageControl release];
    [_detailItemTableview release];
    [super dealloc];
}
@end
