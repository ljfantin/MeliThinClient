//
//  MTCAbtractListItemTableViewViewController.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTCPagerList.h"
#import "MTCMeliServiceApiMockImpl.h"

@interface MTCAbtractListItemTableViewViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property (nonatomic,retain) MTCPagerList * pager;
@property (nonatomic,retain) NSArray * values;
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (retain, nonatomic) NSString * titleHeaderTable;

@end
