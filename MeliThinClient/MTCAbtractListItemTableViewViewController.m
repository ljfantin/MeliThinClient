//
//  MTCAbtractListItemTableViewViewController.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCAbtractListItemTableViewViewController.h"
#import "MTCItemDto.h"
#import "MTCMeliServiceApiMockImpl.h"
#import "MTCPagerList.h"
#import "MTCUIListItemResultTableViewCell.h"

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

    //http://stackoverflow.com/questions/7212859/how-to-set-an-uiactivityindicatorview-when-loading-a-uitableviewcell
    // Do any additional setup after loading the view.
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
   // cell.textLabel.text = item.tittle;
    
    //SE PODRIA FORMATEAR EL NUMERO POR LOCALE
    cell.title.text = item.tittle;
    cell.subtitle.text = item.subtitle;
    cell.price.text = [item.price stringValue];
    cell.thumbnail.image = item.thumbnail;
    
    return cell;
}

/*- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
 
 return 100;
 
 }*/

/*- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return self.footer;
}*/

/*- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.header;
}*/

/*
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}*/


- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
@end
