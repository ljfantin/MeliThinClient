//
//  MTCPictureDto.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 08/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCPictureDto.h"

@implementation MTCPictureDto

+ (instancetype)mtcPictureDtoWithIdentifier:(NSString *)identifier url:(NSString *)url image:(UIImage *)image {
	MTCPictureDto *picture = [[MTCPictureDto alloc] init];
	picture.identifier = identifier;
	picture.url = url;
	picture.image = image;

	return picture;
}

@end
