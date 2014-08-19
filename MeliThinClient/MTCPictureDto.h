//
//  MTCPictureDto.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 08/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTCPictureDto : NSObject
@property (retain, nonatomic) NSString * identifier;
@property (retain, nonatomic) NSString * url;
@property (retain, nonatomic) UIImage * image;

+(instancetype) mtcPictureDtoWithIdentifier:(NSString*)identifier url:(NSString *) url image:(UIImage*) image;
@end
