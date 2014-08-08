//
//  MTCVipItemPhotoGalleryView.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 08/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCVipItemPhotoGalleryView.h"

@implementation MTCVipItemPhotoGalleryView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)loadGallery:(NSArray*)images
{
    for (NSUInteger i = 0; i < [images count]; i++) {
        CGRect frame;
        frame.origin.x = self.scrollGallery.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.scrollGallery.frame.size;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.image = [images objectAtIndex:i];
        [self.scrollGallery addSubview:imageView];
        [imageView release];
    }
    self.scrollGallery.contentSize = CGSizeMake(self.frame.size.width * [images count], self.scrollGallery.frame.size.height);
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = [images count];
}

- (void)dealloc {
    [_pageControl release];
    [_scrollGallery release];
    [super dealloc];
}
@end
