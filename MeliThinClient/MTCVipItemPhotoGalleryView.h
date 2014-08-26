//
//  MTCVipItemPhotoGalleryView.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 08/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTCVipItemPhotoGalleryView : UIView

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollGallery;
@property (weak, nonatomic) IBOutlet UIView *viewTitleItem;
@property (weak, nonatomic) IBOutlet UILabel *labelItemTitle;


- (void)loadImages:(NSArray *)images withTitle:(NSString *)title;

@end
