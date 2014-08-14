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

@implementation MTCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    //Creo el tabbar controller
    self.tabBarController = [[UITabBarController alloc] init];
    
    //creo los view controller, cada uno con su propio navigation controller
    MTCSearchWithHistorialSearchViewController *itemsSearchResultsController = [[MTCSearchWithHistorialSearchViewController alloc] initWithNibName:@"MTCSearchWithHistorialSearchViewController" bundle:nil];

    UITabBarItem *tabBuscar = [[UITabBarItem alloc] initWithTitle:@"Buscar"
                                                            image:[UIImage imageNamed:@"search32.png"] tag:1];
    [itemsSearchResultsController setTabBarItem:tabBuscar];
    
    
    MTCItemsFavoritiesResultsViewController * favoritesController = [[MTCItemsFavoritiesResultsViewController alloc] initWithNibName:@"MTCItemsFavoritiesResultsViewController" bundle:nil];
    
    UITabBarItem *tabFavorites = [[UITabBarItem alloc] initWithTitle:@"Favoritos"
                                                               image:[UIImage imageNamed:@"favoriteIcon32.png"] tag:1];
    [favoritesController setTabBarItem:tabFavorites];
    
    //Creo un navigationcontroller para cada viewcontroller
    UINavigationController *navigationControllerItemSearch = [[UINavigationController alloc] initWithRootViewController:itemsSearchResultsController];
    
    UINavigationController *navigationControllerItemFavorities = [[UINavigationController alloc] initWithRootViewController:favoritesController];
    
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navigationControllerItemSearch,navigationControllerItemFavorities,nil];

    
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
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)customizeNavigationBarAppearance
{
    /*// Create resizable images
    UIImage *gradientImage44 = [[UIImage imageNamed:@"surf_gradient_textured_44"]
                                resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    UIImage *gradientImage32 = [[UIImage imageNamed:@"surf_gradient_textured_32"]
                                resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    // Set the background image for *all* UINavigationBars
    [[UINavigationBar appearance] setBackgroundImage:gradientImage44
                                       forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setBackgroundImage:gradientImage32
                                       forBarMetrics:UIBarMetricsLandscapePhone];*/
    
    // Customize the title text for *all* UINavigationBars
    NSShadow *shadow = [NSShadow new];
    [shadow setShadowColor: [UIColor colorWithWhite:0.0f alpha:0.750f]];
    [shadow setShadowOffset: CGSizeMake(0.0f, 1.0f)];
    
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0],
      NSForegroundColorAttributeName,
      [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8],
                          NSShadowAttributeName, shadow,
      [UIFont fontWithName:@"Arial-Bold" size:0.0],
      NSFontAttributeName,
      nil]];
}

@end
