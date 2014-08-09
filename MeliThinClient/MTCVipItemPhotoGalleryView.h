//
//  MTCVipItemPhotoGalleryView.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 08/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTCVipItemPhotoGalleryView : UIView

@property (retain, nonatomic) IBOutlet UIPageControl *pageControl;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollGallery;
@property (retain, nonatomic) IBOutlet UIView *viewTitleItem;
@property (retain, nonatomic) IBOutlet UILabel *labelItemTitle;


- (void)loadImages:(NSArray*)images withTitle:(NSString*)title;

@end
