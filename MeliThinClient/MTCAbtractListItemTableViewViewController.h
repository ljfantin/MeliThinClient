//
//  MTCAbtractListItemTableViewViewController.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTCPagerList.h"

@interface MTCAbtractListItemTableViewViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property (retain, nonatomic) MTCPagerList * pager;
@property (retain, nonatomic) NSArray * values;
@property (retain, nonatomic) NSString * titleHeaderTable;

@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end
