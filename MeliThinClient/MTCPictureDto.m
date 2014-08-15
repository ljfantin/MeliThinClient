//
//  MTCPictureDto.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 08/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCPictureDto.h"

@implementation MTCPictureDto

+(instancetype) mtcPictureDtoWithId:(NSString*)id url:(NSString *) url image:(UIImage*) image
{
    MTCPictureDto * picture = [[[MTCPictureDto alloc] init] autorelease];
    if (id!=nil && ![id isEqual:[NSNull null]]) {
        picture.id = id;
    }
    if (url!=nil && ![url isEqual:[NSNull null]]) {
        picture.url = url;
    }
    if (image!=nil && ![image isEqual:[NSNull null]]) {
        picture.image = image;
    }
    
    return picture;
}

- (void)dealloc
{
    [_id release];
    _id = nil;
    [_url release];
    _url = nil;
    [_image release];
    _image = nil;
    [super dealloc];

}
@end
