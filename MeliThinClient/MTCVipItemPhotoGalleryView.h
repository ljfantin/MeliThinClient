//
//  MTCVipItemPhotoGalleryView.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 08/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTCVipItemPhotoGalleryView : UIView

@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollGallery;
@property (strong, nonatomic) IBOutlet UIView *viewTitleItem;
@property (strong, nonatomic) IBOutlet UILabel *labelItemTitle;


- (void)loadImages:(NSArray *)images withTitle:(NSString *)title;

@end
