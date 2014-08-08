//
//  MTCPictureDto.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 08/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTCPictureDto : NSObject
@property (retain, nonatomic) NSString * id;
@property (retain, nonatomic) NSString * url;
@property (retain, nonatomic) UIImage * image;

+(instancetype) initWithId:(NSString*)id url:(NSString *) url image:(UIImage*) image;
@end
