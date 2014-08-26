//
//  MTCPictureDto.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 08/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTCPictureDto : NSObject
@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, strong) UIImage *image;

+ (instancetype)mtcPictureDtoWithIdentifier:(NSString *)identifier url:(NSString *)url image:(UIImage *)image;
@end
