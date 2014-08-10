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

#define INDEX_PRICE_FAVORITE_CELL 0
#define INDEX_SUBTITLE_CELL 1
#define INDEX_CONDITION_CELL 2
#define INDEX_AVAILABLE_CELL 3
#define INDEX_DESCRIPCION_CELL 4

#define COUNT_CELLS 5




@interface MTCVipItemViewController ()

@property MTCVipItemPhotoGalleryView * gallery;
@property MTCVipItemTableViewFooter * footer;

@end

@implementation MTCVipItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _service = [[MTCMeliServiceApiImpl alloc] init];
        [_service setDelegate:self];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _gallery= [[[NSBundle mainBundle] loadNibNamed:@"MTCVipItemPhotoGalleryView" owner:self options:nil] firstObject];
    
    _footer= [[[NSBundle mainBundle] loadNibNamed:@"MTCVipItemTableViewFooter" owner:self options:nil] firstObject];

    [self.service pictures:self.item.id];
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
    return COUNT_CELLS;
}

/*- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (![self.item.buyingMode isBuyItNow]) {
        return self.footer;
    }
    else
    {
        return nil;
    }
    //return self.footer;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;
{
    if (![self.item.buyingMode isBuyItNow]) {
        return self.footer.frame.size.height;
    }
    else
    {
        return 0;
    }
}*/


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    switch (indexPath.row) {
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
    cell.textLabel.text = @"subtitulo";//self.item.subtitle;
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


#pragma mark - Implementacion de UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    CGFloat pageWidth = sender.frame.size.width;
    int page = floor((sender.contentOffset.x - pageWidth / 2 ) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}

- (void) onPostExecute:(NSArray *) data
{
    NSMutableArray * images = [NSMutableArray array];
    for (MTCPictureDto * pictureDto in data) {
        [images addObject:pictureDto.image];
    }
    [self.gallery loadImages:images withTitle:self.item.tittle];
}

- (void) onPreExecute
{
    
}

- (void)dealloc
{
    [_gallery release];
    [_pageControl release];
    [_detailItemTableview release];
    [super dealloc];
}
@end
