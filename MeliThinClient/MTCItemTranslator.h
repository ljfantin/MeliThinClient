//
//  MTCItemTranslator.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 10/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTCPicturesJsonTranslator.h"

@interface MTCItemTranslator : NSObject<MTCJsonTranslator>
@property (nonatomic,retain) MTCPicturesJsonTranslator * picturesTranslator;
@end
