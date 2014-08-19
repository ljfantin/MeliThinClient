//
//  MTCPictureDto.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 08/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCPictureDto.h"

@implementation MTCPictureDto

+(instancetype) mtcPictureDtoWithIdentifier:(NSString*)identifier url:(NSString *) url image:(UIImage*) image
{
    MTCPictureDto * picture = [[[MTCPictureDto alloc] init] autorelease];
    picture.identifier = identifier;
    picture.url = url;
    picture.image = image;
    
    return picture;
}

- (void)dealloc
{
    [_identifier release];
    _identifier = nil;
    [_url release];
    _url = nil;
    [_image release];
    _image = nil;
    [super dealloc];

}
@end
