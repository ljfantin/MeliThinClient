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

@interface MTCVipItemViewController ()

@property NSMutableArray * fieldsValues;
@property NSMutableArray * fieldsNames;
@property MTCVipItemPhotoGalleryView * gallery;

@end

@implementation MTCVipItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _fieldsValues = [NSMutableArray array];
        _fieldsNames = [NSMutableArray array];
        _service = [[MTCMeliServiceApiImpl alloc] init];
        [_service setDelegate:self];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.item.tittle!=nil)    {
        
        [self.fieldsNames addObject:@"Titulo"];
        [self.fieldsValues addObject:self.item.tittle];
    }
    
    if (self.item.subtitle!=nil)    {
        
        [self.fieldsNames addObject:@"Subtitulo"];
        [self.fieldsValues addObject:self.item.subtitle];
    }
    
    if (self.item.price!=nil)    {
        
        [self.fieldsNames addObject:@"Precio"];
        [self.fieldsValues addObject:[self.item.price stringValue]];
    }
    
    if (self.item.availableQuantity!=nil)    {
        
        [self.fieldsNames addObject:@"Cantidad"];
        [self.fieldsValues addObject:[self.item.availableQuantity stringValue]];
    }

    _gallery= [[[NSBundle mainBundle] loadNibNamed:@"MTCVipItemPhotoGalleryView" owner:self options:nil] firstObject];

    
    [self.service pictures:self.item.id];
    self.detailItemTableview.tableHeaderView = _gallery;
    //TODO SACAR ESTO
    self.detailItemTableview.tableFooterView = [UIView new];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Implementacion de UITableViewDatasource
/*- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.gallery;
}*/


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.fieldsValues count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellDetail"];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"cellDetail"] autorelease];
    }
    cell.textLabel.text = self.fieldsNames[indexPath.row];
    cell.detailTextLabel.text = self.fieldsValues[indexPath.row];
    
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
    [_fieldsNames release];
    [_fieldsValues release];
    [_gallery release];
    [_pageControl release];
    [_detailItemTableview release];
    [super dealloc];
}
@end
