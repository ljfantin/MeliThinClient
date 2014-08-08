//
//  MTCVipItemViewController.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 08/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTCItemDto.h"
#import "MTCServiceApiDelegate.h"
#import "MTCMeliServiceApi.h"

@interface MTCVipItemViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,MTCServiceApiDelegate>

@property (retain,nonatomic) MTCItemDto * item;
@property (retain, nonatomic) IBOutlet UIPageControl *pageControl;
@property (retain, nonatomic) IBOutlet UITableView *detailItemTableview;
@property (retain, nonatomic) id<MTCMeliServiceApi> service;

@end
