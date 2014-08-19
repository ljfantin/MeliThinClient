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
#import "MTCPriceFavoriteButtonVipItemViewTableViewCell.h"
#import "MTCVipItemTableViewFooter.h"
#import "MTCItemDto.h"
#import "MTCDescriptionVipItemViewController.h"
#import "MTCMeliServiceApiImpl+SecureMethods.h"

#define INDEX_PRICE_FAVORITE_CELL 0
#define INDEX_SUBTITLE_CELL 1
#define INDEX_CONDITION_CELL 2
#define INDEX_AVAILABLE_CELL 3
#define INDEX_DESCRIPCION_CELL 4



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
        _picturesTranslator = [[MTCPicturesJsonTranslator alloc] init];
        _cells = [[NSMutableArray alloc] init];
        _cellsCount = 0;
        _imageIsFavorite = [UIImage imageNamed:@"heart-rojo.png"];
        _imageIsNotFavorite = [UIImage imageNamed:@"heart-gris.png"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _gallery= [[[NSBundle mainBundle] loadNibNamed:@"MTCVipItemPhotoGalleryView" owner:self options:nil] firstObject];
    
    if ([self.item.buyingMode isBuyItNow])  {
        _footer= [[[NSBundle mainBundle] loadNibNamed:@"MTCVipItemTableViewFooter" owner:self options:nil] firstObject];
        self.detailItemTableview.tableFooterView = _footer;
    }

    [self.service itemWithIdentifier:self.item.identifier attributes:@[@"pictures",@"descriptions"]];
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
    //if (self.item.descriptions!=nil && [self.item.descriptions count]>0) {
        self.cells[self.cellsCount] = [NSNumber numberWithInteger:INDEX_DESCRIPCION_CELL];
        self.cellsCount++;
    //}
    self.detailItemTableview.tableHeaderView = _gallery;
}

- (void) initStateFavoriteButton
{
    MTCFavoriteManager * favoriteManager = [MTCFavoriteManager sharedInstance];
    NSArray * idsFavorites = [favoriteManager arrayWithObjectsWithId];
    
    self.item.isFavorite = [idsFavorites containsObject:self.item.identifier];
    if (self.item.isFavorite) {
        
        [self.addFavoriteButton setImage:_imageIsFavorite forState:UIControlStateNormal];
    }
    else
    {
        [self.addFavoriteButton setImage:_imageIsNotFavorite forState:UIControlStateNormal];
    }
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
        default:
            break;
    }
    
    return cell;
}

- (UITableViewCell*) buildPriceFavoriteCell:(UITableView *)tableView
{
    static NSString *idPriceFavoriteCell = @"idPriceFavoriteCell";

    MTCPriceFavoriteButtonVipItemViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idPriceFavoriteCell];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MTCPriceFavoriteButtonVipItemViewTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    NSMutableString * price = [NSMutableString string];
    [price appendString:self.item.currency.symbol];
    [price appendString:[self.item.price stringValue]];
    cell.priceLabel.text = price;
    [self initStateFavoriteButton];
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
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idConditionCell] autorelease];
    }
    
    if ([self.item.condition isNew]) {
        cell.textLabel.text = NSLocalizedString(@"item.condition.new", nil);
    
    } else if ([self.item.condition isUsed]) {
        cell.textLabel.text = NSLocalizedString(@"item.condition.used", nil);
    
    } else if ([self.item.condition isUnespecified]) {
        cell.textLabel.text = NSLocalizedString(@"item.condition.unespecified", nil);
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
    cell.textLabel.text = NSLocalizedString(@"descripcion.title",nil);
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
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:idSubtitleCell] autorelease];
    }
    cell.textLabel.text = NSLocalizedString(@"cantidad.title",nil);
    //Ver esto
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    cell.detailTextLabel.text = [self.item.availableQuantity stringValue];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.cells[indexPath.row] intValue] == INDEX_DESCRIPCION_CELL) {
    
        MTCDescriptionVipItemViewController * descriptionViewController = [[MTCDescriptionVipItemViewController alloc] init];
        descriptionViewController.idItem = self.item.identifier;
        [self.navigationController pushViewController:descriptionViewController animated:YES];
    }
}

- (IBAction)addFavoritePushButton:(id)sender {
    
    if (self.item.isFavorite)
    {
        [self.service removeBookmark:_item withToken:nil];
        [self.addFavoriteButton setImage:_imageIsNotFavorite forState:UIControlStateNormal];
    }
    else
    {
        [self.service addBookmark:_item withToken:nil];
        [self.addFavoriteButton setImage:_imageIsFavorite forState:UIControlStateNormal];
    }
    self.item.isFavorite = !self.item.isFavorite;
}

- (IBAction)pushBuyButton:(id)sender
{
    NSString * title = NSLocalizedString(@"view.confirmation.title", nil);
    NSString * message = NSLocalizedString(@"view.confirmation.message",nil);
    NSString * buttonOkTitle = NSLocalizedString(@"view.confirmation.buttonOk",nil);
    NSString * buttonCancelTitle = NSLocalizedString(@"view.confirmation.buttonCancel",nil);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title  message:message delegate:self cancelButtonTitle:buttonCancelTitle otherButtonTitles:buttonOkTitle, nil];
    [alert show];
    [alert release];
}


#pragma mark - Implementacion de UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    CGFloat pageWidth = sender.frame.size.width;
    int page = floor((sender.contentOffset.x - pageWidth / 2 ) / pageWidth) + 1;
    if (self.pageControl.currentPage!=page) {
        self.pageControl.currentPage = page;
        [self changePage];
    }
}

- (void) changePage
{
    CGRect frame;
    frame.origin.x = self.galleryScrollView.frame.size.width * self.pageControl.currentPage;
    frame.origin.y = 0;
    frame.size = self.galleryScrollView.frame.size;
    [self.galleryScrollView scrollRectToVisible:frame animated:YES];
}

- (IBAction)valueChanged:(id)sender
{
    [self changePage];
}


#pragma mark implementacion delegate MTCServiceApiDelegate
- (void) onPostExecute:(NSDictionary *) data
{
    self.item.pictures = [self.picturesTranslator arrayFromDictionaryWithJson:data];
    NSMutableArray * images = [[NSMutableArray alloc] init];
    for (MTCPictureDto * pictureDto in self.item.pictures) {
        [images addObject:pictureDto.image];
    }
    [self.spinnerGallery stopAnimating];
    [self.gallery loadImages:images withTitle:self.item.title];
}

- (void) onPreExecute
{
    [self.spinnerGallery startAnimating];
}

- (void)dealloc
{
    [_item release];
    _item = nil;
    [_pageControl release];
    _pageControl = nil;
    _detailItemTableview.dataSource = nil;
    _detailItemTableview.delegate = nil;
    [_detailItemTableview release];
    _detailItemTableview = nil;
    [_service release];
    _service = nil;
    [_picturesTranslator release];
    _picturesTranslator = nil;
    [_imageIsFavorite release];
    _imageIsFavorite = nil;
    [_imageIsNotFavorite release];
    _imageIsNotFavorite = nil;
    [_spinnerGallery release];
    _spinnerGallery = nil;
    [_gallery release];
    _gallery = nil;
    [_footer release];
    _footer = nil;
    [_cells release];
    _cells = nil;
    [_galleryScrollView release];
    _galleryScrollView = nil;
    [super dealloc];
}

@end
