//
//  MTCVipItemViewController.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 08/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTCItemSearchResultDto.h"
#import "MTCServiceApiDelegate.h"
#import "MTCMeliServiceApi.h"
#import "MTCItemDto.h"
#import "MTCItemTranslator.h"
#import "MTCPicturesJsonTranslator.h"
#import "MTCMeliServiceApiImpl.h"
#import "MTCFavoriteDaoImpl.h"


@interface MTCVipItemViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,MTCServiceApiDelegate,UIAlertViewDelegate>

@property (retain, nonatomic) IBOutlet UIButton *addFavoriteButton;
- (IBAction)addFavoritePushButton:(id)sender;
- (IBAction)pushBuyButton:(id)sender;


@property (retain,nonatomic) MTCItemDto * item;
@property (retain, nonatomic) IBOutlet UIPageControl *pageControl;
@property (retain, nonatomic) IBOutlet UITableView *detailItemTableview;
@property (retain, nonatomic) MTCMeliServiceApiImpl * service;

@property (retain, nonatomic) MTCPicturesJsonTranslator * picturesTranslator;
@property (retain, nonatomic) UIImage * imageIsFavorite;
@property (retain, nonatomic) UIImage * imageIsNotFavorite;

@property (retain, nonatomic) MTCFavoriteDaoImpl * dao;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *spinnerGallery;


@end
