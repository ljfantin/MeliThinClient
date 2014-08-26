//
//  MTCSearchWithHistorialSearchViewController.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 14/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTCSearchHistoryManager.h"


@interface MTCSearchWithHistorialSearchViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *historialTableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (strong, nonatomic) NSArray *listHistorial;
@property (strong, nonatomic) NSMutableArray *listHistorialFiltered;
@property (weak, nonatomic) IBOutlet UIImageView *imageLogo;
@property BOOL isFiltered;
@end
