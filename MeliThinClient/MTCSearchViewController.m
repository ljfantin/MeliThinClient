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
#import "MTCItemsFavoritiesResultsViewController.h"


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

    _tab = [[UITabBarController alloc] init];
    MTCItemsSearchResultsViewController * itemsSearchResultsController = [[MTCItemsSearchResultsViewController alloc] init];
    itemsSearchResultsController.searchQuery = @"peugeot";

    MTCItemsFavoritiesResultsViewController * favoritesController = [[MTCItemsFavoritiesResultsViewController alloc] init];
    
    //[itemsSearchResultsController setFinishedSelectedImage:[UIImage imageNamed:@"search32.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"search32.png"]];
    //[favoritesController setFinishedSelectedImage:[UIImage imageNamed:@"favoriteIcon32.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"favoriteIcon32.png"]];

    _tab.viewControllers = [NSArray arrayWithObjects:itemsSearchResultsController,favoritesController,nil];
    //[self.view addSubview:self.tab.view];
    [self.navigationController pushViewController:_tab animated:YES];

    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    //creo el controller
    //MTCItemsSearchResultsViewController * nextController = [[MTCItemsSearchResultsViewController alloc] init];
    //seteo la busqueda
    //nextController.searchQuery = @"peugeot";
    //pusheo el controller
    //[self.navigationController pushViewController:nextController animated:YES];
    //[self.navigationController pushViewController:nextController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
