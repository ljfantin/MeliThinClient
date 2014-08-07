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
@property (nonatomic,retain) NSNumber * price;
@property (nonatomic,retain) NSString * subtitle;
@property (nonatomic,retain) NSNumber * availableQuantity;
@property (nonatomic,retain) NSString * condition;
@property (nonatomic,retain) UIImage * thumbnail;

+(instancetype) initWithTitle:(NSString *) tittle price:(NSNumber*) price subtitle:(NSString*) subtitle  availableQuantity:(NSNumber*)quantity condition:(NSString*)condition thumbnail:(UIImage*) image;

@end
