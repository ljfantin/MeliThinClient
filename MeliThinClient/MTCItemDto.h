//
//  MTCItemDto.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTCItemDto : NSObject
@property (nonatomic,retain) NSString * tittle;
@property (nonatomic,retain) NSString * price;
@property (nonatomic,retain) UIImage * thumbnail;

+(instancetype) initWithTitle:(NSString *) tittle price:(NSString*) price thumbnail:(UIImage*) image;

@end
