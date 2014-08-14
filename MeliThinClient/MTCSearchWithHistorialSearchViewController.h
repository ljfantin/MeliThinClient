//
//  MTCSearchWithHistorialSearchViewController.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 14/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTCSearchHistoryDao.h"


@interface MTCSearchWithHistorialSearchViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate, UISearchBarDelegate>

@property (retain, nonatomic) IBOutlet UITableView *historialTableView;
@property (retain, nonatomic) IBOutlet UISearchBar *searchBar;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
//@property (retain, nonatomic) MTCSearchHistoryDao * searchHistoryDao;
@property (retain, nonatomic) NSArray * listHistorial;

@end
