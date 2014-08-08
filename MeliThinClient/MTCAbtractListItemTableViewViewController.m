//
//  MTCAbtractListItemTableViewViewController.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCAbtractListItemTableViewViewController.h"
#import "MTCItemDto.h"
#import "MTCPagerList.h"
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
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return NUMBER_OF_SECCCIONS;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return [self.values count];
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
    
    MTCItemDto * item = [self.values objectAtIndex:indexPath.row];
    //SE PODRIA FORMATEAR EL NUMERO POR LOCALE
    cell.title.text = item.tittle;
    cell.subtitle.text = item.subtitle;
    cell.price.text = [item.price stringValue];
    cell.thumbnail.image = item.thumbnail;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.titleHeaderTable;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MTCItemDto * itemDto = [self.values objectAtIndex:indexPath.row];
    //creo el controller
    MTCVipItemViewController * nextController = [[MTCVipItemViewController alloc] init];
    //seteo la busqueda
    nextController.item = itemDto;
    //pusheo el controller
    [self.navigationController pushViewController:nextController animated:YES];
}

- (void)dealloc {
    [_tableView release];
    [_spinner release];
    [super dealloc];
}


@end
