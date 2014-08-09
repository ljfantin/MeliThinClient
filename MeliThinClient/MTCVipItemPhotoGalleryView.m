//
//  MTCVipItemPhotoGalleryView.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 08/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCVipItemPhotoGalleryView.h"

@interface MTCVipItemPhotoGalleryView ()

@end


@implementation MTCVipItemPhotoGalleryView


- (void)loadImages:(NSArray*)images withTitle:(NSString*)title;
{
    for (NSUInteger i = 0; i < [images count]; i++) {
        CGRect frame;
        frame.origin.x = self.scrollGallery.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.scrollGallery.frame.size;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.contentMode=UIViewContentModeScaleAspectFit;
        imageView.image = [images objectAtIndex:i];
        [self.scrollGallery addSubview:imageView];
        [imageView release];
    }
    self.scrollGallery.contentSize = CGSizeMake(self.frame.size.width * [images count], self.scrollGallery.frame.size.height);
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = [images count];
    self.labelItemTitle.text=title;
    [self addSubview:self.viewTitleItem];
}

- (void)dealloc {
    [_pageControl release];
    [_scrollGallery release];
    [_viewTitleItem release];
    [_labelItemTitle release];
    [super dealloc];
}
@end
