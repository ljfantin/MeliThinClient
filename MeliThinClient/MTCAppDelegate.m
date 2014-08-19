//
//  MTCAppDelegate.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCAppDelegate.h"
#import "MTCItemsSearchResultsViewController.h"
#import "MTCItemsFavoritiesResultsViewController.h"
#import "MTCSearchWithHistorialSearchViewController.h"
#import "UIColor+MTCColorPalette.h"
#import "AFNetworkReachabilityManager.h"


@implementation MTCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    //Creo el tabbar controller
    self.tabBarController = [[UITabBarController alloc] init];
    
    //creo los view controller, cada uno con su propio navigation controller
    MTCSearchWithHistorialSearchViewController *itemsSearchResultsController = [[MTCSearchWithHistorialSearchViewController alloc] initWithNibName:@"MTCSearchWithHistorialSearchViewController" bundle:nil];

    UITabBarItem *tabBuscar = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"tab.search.title",nil)
                                                            image:[UIImage imageNamed:@"search.png"] tag:1];
    [itemsSearchResultsController setTabBarItem:tabBuscar];
    
    
    MTCItemsFavoritiesResultsViewController * favoritesController = [[MTCItemsFavoritiesResultsViewController alloc] initWithNibName:@"MTCItemsFavoritiesResultsViewController" bundle:nil];
    
    UITabBarItem *tabFavorites = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"tab.bookmark.title",nil)
                                                               image:[UIImage imageNamed:@"heart-vacio.png"] tag:1];
    [favoritesController setTabBarItem:tabFavorites];
    
    //Creo un navigationcontroller para cada viewcontroller
    UINavigationController *navigationControllerItemSearch = [[UINavigationController alloc] initWithRootViewController:itemsSearchResultsController];
    
    UINavigationController *navigationControllerItemFavorities = [[UINavigationController alloc] initWithRootViewController:favoritesController];
    
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navigationControllerItemSearch,navigationControllerItemFavorities,nil];

    [self customizeNavigationBarAppearance];
    
    //le seteo el tabbar controller como root
    [self.window setRootViewController:self.tabBarController];
    
    [navigationControllerItemSearch release];
    [navigationControllerItemFavorities release];
    [itemsSearchResultsController release];
    [favoritesController release];
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
}

- (void)customizeNavigationBarAppearance
{
    [[UINavigationBar appearance] setBarTintColor:[UIColor meliYellowColor]];
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor blackColor], NSForegroundColorAttributeName,
                                                           shadow, NSShadowAttributeName,
                                                           [UIFont fontWithName:@"Arial" size:21.0], NSFontAttributeName, nil]];
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
}

@end
