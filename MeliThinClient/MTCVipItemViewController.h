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
#import "MTCFavoriteManager.h"


@interface MTCVipItemViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate, MTCServiceApiDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UIButton *addFavoriteButton;
- (IBAction)addFavoritePushButton:(id)sender;
- (IBAction)pushBuyButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIScrollView *galleryScrollView;
- (IBAction)valueChanged:(id)sender;


@property (strong, nonatomic) MTCItemDto *item;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) IBOutlet UITableView *detailItemTableview;
@property (strong, nonatomic) MTCMeliServiceApiImpl *service;
@property (strong, nonatomic) MTCPicturesJsonTranslator *picturesTranslator;
@property (strong, nonatomic) UIImage *imageIsFavorite;
@property (strong, nonatomic) UIImage *imageIsNotFavorite;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinnerGallery;


@end
