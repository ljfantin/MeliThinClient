//
//  MTCVipItemViewController.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 08/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTCItemSearchResultDto.h"
#import "MTCItemDto.h"
#import "MTCItemTranslator.h"
#import "MTCPicturesJsonTranslator.h"
#import "MTCMeliServiceApi.h"
#import "MTCFavoriteManager.h"


@interface MTCVipItemViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate,UIAlertViewDelegate>

@property (retain, nonatomic) IBOutlet UIButton *addFavoriteButton;
- (IBAction)addFavoritePushButton:(id)sender;
- (IBAction)pushBuyButton:(id)sender;
@property (retain, nonatomic) IBOutlet UIScrollView *galleryScrollView;
- (IBAction)valueChanged:(id)sender;


@property (retain, nonatomic) MTCItemDto *item;
@property (retain, nonatomic) IBOutlet UIPageControl *pageControl;
@property (retain, nonatomic) IBOutlet UITableView *detailItemTableview;
@property (retain, nonatomic) MTCMeliServiceApi *service;
@property (retain, nonatomic) MTCPicturesJsonTranslator *picturesTranslator;
@property (retain, nonatomic) UIImage *imageIsFavorite;
@property (retain, nonatomic) UIImage *imageIsNotFavorite;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *spinnerGallery;


@end
