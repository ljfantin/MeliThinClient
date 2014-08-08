//
//  MTCSearchViewController.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCSearchViewController.h"
#import "MTCItemsSearchResultsViewController.h"
#import "MTCMeliServiceApiImpl.h"


@interface MTCSearchViewController ()

@end

@implementation MTCSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Mercadolibre";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    //creo el controller
    MTCItemsSearchResultsViewController * nextController = [[MTCItemsSearchResultsViewController alloc] init];
    //seteo la busqueda
    nextController.searchQuery = @"sarasa";
    //pusheo el controller
    [self.navigationController pushViewController:nextController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
