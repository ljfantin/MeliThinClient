//
//  MTCSearchViewController.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCSearchFavoritesTabBarViewController.h"
#import "MTCItemsSearchResultsViewController.h"
#import "MTCMeliServiceApiImpl.h"
#import "MTCItemsFavoritiesResultsViewController.h"


@interface MTCSearchFavoritesTabBarViewController ()

@end

@implementation MTCSearchFavoritesTabBarViewController

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
    UITabBarItem *tabBuscar = [[UITabBarItem alloc] initWithTitle:@"Buscar"
                                                            image:[UIImage imageNamed:@"search32.png"] tag:1];
    [itemsSearchResultsController setTabBarItem:tabBuscar];


    MTCItemsFavoritiesResultsViewController * favoritesController = [[MTCItemsFavoritiesResultsViewController alloc] init];
    UITabBarItem *tabFavorites = [[UITabBarItem alloc] initWithTitle:@"Favoritos"
                                                            image:[UIImage imageNamed:@"favoriteIcon32.png"] tag:1];
    [favoritesController setTabBarItem:tabFavorites];

    /*
    UIImage* tabBarBackground = [UIImage imageNamed:@"tabbar.png"];
    [[UITabBar appearance] setBackgroundImage:tabBarBackground];
    
    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"selection-tab.png"]];
     */
    
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
