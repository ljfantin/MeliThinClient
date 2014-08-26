//
//  MTCAbtractListItemTableViewViewController.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTCPagerList.h"
#import "MTCMeliServiceApiImpl.h"
#import "UIScrollView+SVPullToRefresh.h"
#import "UIScrollView+SVInfiniteScrolling.h"
#import "MTCServiceApiDelegate.h"

@interface MTCAbtractListItemTableViewViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate, MTCServiceApiDelegate>

@property (strong, nonatomic) MTCPagerList *pager;
@property (strong, nonatomic) NSMutableArray *items;
@property (strong, nonatomic) NSString *titleHeaderTable;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

- (void)requestNewItems;
- (void)updateTitle:(NSString *)title withCount:(NSInteger)countResults;
@end
