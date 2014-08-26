//
//  MTCPictureDto.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 08/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTCPictureDto : NSObject
@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) UIImage *image;

+ (instancetype)mtcPictureDtoWithIdentifier:(NSString *)identifier url:(NSString *)url image:(UIImage *)image;
@end
